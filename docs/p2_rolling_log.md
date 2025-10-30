2025-10-26 run qc on the files
- [x] find metadata file on Sciebo
- [x] process/export metadata
- [x] find data on Hilbert: /gpfs/project/projects/MedRheuma/SkinSingleCell_Natlas/
- [ ] unzip all files in separate directories
    ## list file paths in tar (too many files, don't need all):
    tar -ztf test.tar.gz | grep "filtered_feature_bc_matrix.h5"
    
    # extract specific files in directory (basic command - but I have to extract to a differntly named dir to not overlap with Nan's)
    tar -zxvf <tar filename> <file you want to extract>
    /gpfs/project/projects/MedRheuma/SkinSingleCell_Natlas/gse138669_ssc/cellranger_count/SC33/outs/filtered_feature_bc_matrix/filtered_feature_bc_matrix.h5

    for f in *.tar; do 
      d=`basename "$f" .tar`
      mkdir "$d"
      (cd "$d" && tar xf "../$f")
    done

    tar -xzf lotsofdata.tar.gz --wildcards --no-anchored '*contract*'

#---------
    mkdir ../../balmir/projects/p2_scrnaseq_natlas_ssc/data/internal/cell_ranger_count/gse138669/
    cd ../../balmir/projects/p2_scrnaseq_natlas_ssc/data/internal/cell_ranger_count/gse138669/
    
    ## didn't work to specify a file name to extract but it works with wildcards:
   /usr/bin/time -v tar -xzf ../../../../../../../SkinSingleCell_Natlas/gse249279_ssc/cellranger_count.tar.gz -C ./ --wildcards --no-anchored '*filtered_feature_bc_matrix.h5*' 
    ## extra:
    ## on piped:
    /usr/bin/time -f "%E"
    ## beep:
    echo $'\a' 
    tput bel

    ## to try
    /usr/bin/time -v tar -xzf ../../../../../../../SkinSingleCell_Natlas/gse138669_ssc/cellranger_count.tar.gz -C ./ --wildcards --no-anchored '*filtered_feature_bc_matrix.h5*' && echo $'\a'


- [ ] TODO: make the script for later: [~/Documents/projects/p2_scrnaseq_natlas_ssc/codebase/01_extract_cellranger_archives/01_cellranger_count.sh
- [ ] TODO: samplesheet for loc from Denbi

- [x] create env and send it to hb
    conda env create -f 02_seurat_general.yaml -p ./02_seurat_general/
    (only once): conda install conda-pack
    conda pack -n 02_seurat_general -o 02_seurat_general.tar.gz
    globus transfer
   
  	mkdir -p ./02_seurat_general/
	tar -xzf 02_seurat_general.tar.gz -C ./02_seurat_general/




- [x] remove Miniforge and install Miniconda
    - the env I made for Hilbert doesn't work - needs a library which never happened before with Miniconda. 
    rm -rf ~/miniforge
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-*
    source ~/.bashrc

	conda config --show channels
	conda config --add channels bioconda
	conda config --add channels conda-forge
	conda config --add channels mpi-ie
	conda config --set channel_priority strict

	conda install -c conda-forge mamba -y

- [ ] recreate env, move to hb and test
    
    conda env create -f 02_seurat_general.yaml -p ./02_seurat_general/
    

