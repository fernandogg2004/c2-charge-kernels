#!/bin/sh
# Full build of the kernel-only proof.
#
# A plain `lake build` would compile up to one module per CPU thread at once; each of the 310
# certificate shards needs 1-2 GB of memory, so the shards are first built here as a bounded work
# queue (P concurrent single-module builds), then `lake build` finishes the rest.
#
# Usage: ./build.sh [P]     (default P = 4; allow about 2 GB of RAM per process)
set -e
cd "$(dirname "$0")"
P=${1:-4}
lake exe cache get                                   # prebuilt Mathlib
lake build ChargeKernel.Pt900.Data ChargeKernel.CertNatSound ChargeKernel.CertBridgeSym
mkdir -p .lake/shard-logs
xargs -P "$P" -I{} sh -c 'lake build {} > .lake/shard-logs/{}.log 2>&1 || { echo "FAILED {}"; exit 255; }; echo "built {}"' \
  < ChargeKernel/Pt900/modules.txt
lake build                                           # assembly, diamond check, main theorem
cat > .lake/axioms.lean <<'EOF'
import ChargeKernel
#print axioms ChargeKernel.Pt900.weakTypeConstant_two_le
EOF
lake env lean .lake/axioms.lean
