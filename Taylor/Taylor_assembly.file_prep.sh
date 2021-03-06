#! /bin/bash


# Set the queue that will get your job
# to test a job, use the debug queue (this has a max walltime of 5 min)
#
#PBS -q comm_mmem_day
#
# for actual jobs, you can use the comm_mmem_day or comm_mmem_week queue


# Set the walltime, which is the maximum time that your job can run in HH:MM:SS
# this can not exceed the maximum walltime determined by the queue that you set above
#
#PBS -lwalltime=04:00:00

# Set the number of nodes, and the number of processors per node (up to 12), that you want to use
#
#PBS -lnodes=1:ppn=4,pvmem=9gb


## Give your job a name
#
#PBS -N assembly_qc

## Provide your email address, to receive notification when your job starts and ends
#
#PBS -m abe -M jdtaylor1@mix.wvu.edu

# a number of software packages are available in the "genomics" module on spruce
# this is only one of many modules
# you can see all modules and their packages using "module available"

# if you want to use any software in the genomics module, you first have to load the module
# for example: module load genomics
# we only need to load the bioconda environment
# this provides access to all of the software that you will need for class
# you can find more info at https://wiki.hpc.wvu.edu/hpc_wiki/index.php/BioConda
#
# DO NOT CHANGE THESE THREE LINES
#
module load genomics/bioconda
source /shared/software/miniconda3/etc/profile.d/conda.sh
conda activate tpd0001

# once an env is activated you may list the available modules using "conda list"


# cd into your working dir on the scratch drive
# your home dir is limited to 5GB so it is usually advisable to work on the 'scratch'
# you have essentially unlimited space on scratch, but files can be deleted to make room for other users
# 
# the absolute path to your top-level scratch dir is /scratch/USERNAME (eg., /scratch/tpd0001)
# you can use the environmental variable $SCRATCH as a shortcut
#
cd $SCRATCH


# put your commmand(s) in here
#

# move your read files to the cluster
#curl https://sra-pub-src-1.s3.amazonaws.com/SRR10997251/RDRIP_20180711_K00134_IL100105221_TACCATGG-JD3_L007_R1.fastq.gz.1 > R1.fastq.gz
#curl https://sra-pub-src-1.s3.amazonaws.com/SRR10997251/RDRIP_20180711_K00134_IL100105221_TACCATGG-JD3_L007_R2.fastq.gz.1 > R2.fastq.gz


# decompress your files
tar -zxvf SRR3926146_1.fastq.tgz
tar -zxvf SRR3926146_2.fastq.tgz


# run fastqc
fastqc SRR3926146_1.fastq
fastqc SRR3926146_2.fastq





# deactivate the conda session when you have finished with your pipeline
conda deactivate

