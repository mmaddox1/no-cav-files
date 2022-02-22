#! /bin/bash
#
#PBS -l walltime=96:00:00
#PBS -l nodes=2:ppn=32
#PBS -W group_list=dragonstooth
#PBS -q normal_q
#PBS -A cavitation
#PBS -M mmaddox1@vt.edu
#PBS -m bea
#
cd $PBS_O_WORKDIR
#
module purge
module load gcc/6.1.0
module load openmpi/3.0.0
module load python
module load OpenFOAM/v1906
#
#  Define OpenFOAM environment.
#
. $OPENFOAM_DIR/OpenFOAM-v1906/etc/bashrc
#
#
# decomposePar
#
mpirun -np 64 interPhaseChangeFoam -parallel >logsin.txt
#
reconstructPar
#
echo "Normal end of execution."
