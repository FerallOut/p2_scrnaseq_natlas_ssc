#!/bin/env/bash

## to extract h5 files from multiple .tar.gz archives from cellranger
${main_dir}="/gpfs/project/projects/MedRheuma"
${source_dir}=${main_dir}"/SkinSingleCell_Natlas"
${output_dir}=${main_dir}"/balmir/projects/p2_scrnaseq_natlas_ssc/data/internal/cellranger_count"

find ${source_dir} -iname "*.tar.gz" | sort -V | xargs -I file sh -c '/usr/bin/time -v tar -xzf file -C ./ --wildcards --no-anchored "*filtered_feature_bc_matrix.h5* -C ${output_dir}' >> ${output_dir}"/../../../scripts/02_extract_h5_files_from_archives.log"
