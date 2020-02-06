#!/bin/bash
export CORES=504
export RLM_LICENSE=2765@129.146.96.65
module load /mnt/nfs-share/install/converge/Convergent_Science/Environment/modulefiles/CONVERGE/CONVERGE-IntelMPI/3.0.10
echo $RLM_LICENSE
which mpirun
mpirun -version
mpirun -n $CORES -ppn 36 -iface enp94s0f0 -genv I_MPI_FABRICS=shm:dapl -genv DAT_OVERRIDE=/etc/dat.conf -genv I_MPI_DAT_LIBRARY=/usr/lib64/libdat2.so -genv I_MPI_DAPL_PROVIDER=ofa-v2-cma-roe-enp94s0f0 -genv I_MPI_FALLBACK=0 -genv I_MPI_PIN=yes -f /mnt/nfs-share/converge/machinefile -genv I_MPI_DEBUG=6 converge-intelmpi -c -S | tee logfile.out
