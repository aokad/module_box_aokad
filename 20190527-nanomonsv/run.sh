set -x

mkdir -p ${OUTPUT_DIR}

BIN_DIR=/usr/local/nanomon-sv-0.0.1

if [ -n "$INPUT_BAM" ]
then
    python ${BIN_DIR}/run-nanomon-sv.py parse -i ${INPUT_BAM} -o ${OUTPUT_DIR}/${SAMPLE}. 
    INPUT_JUNCTION=${OUTPUT_DIR}/${SAMPLE}.junction.sort.gz
    rm ${OUTPUT_DIR}/${SAMPLE}.junction.sort.txt ${OUTPUT_DIR}/${SAMPLE}.junction.unsort.txt ${OUTPUT_DIR}/${SAMPLE}.junction.sort.txt.sa.json
fi

if [ -n "$INPUT_BP" ]
then
    python ${BIN_DIR}/run-nanomon-sv.py fetch --input_bp ${INPUT_BP} --parsed_file ${INPUT_JUNCTION} --output_prefix ${OUTPUT_DIR}/${SAMPLE}.fetch
fi

