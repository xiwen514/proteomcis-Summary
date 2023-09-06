# file dirs
fasta_dir=/home/xiwenz/project/proteomics_preprocessing/SHRJH_NMO_20220111/fasta
raw_dir=/home/xiwenz/project/proteomics_preprocessing/SHRJH_NMO_20220111/rawdata
xml_dir=/home/xiwenz/project/proteomics_preprocessing/SHRJH_NMO_20220111/xml_test

# file names
# sample_names=`ls $raw_dir | grep -v "index" | grep -v "combine"`
sample_names=`ls $raw_dir | grep "raw"`

# sample names
results=()
for i in $sample_names; do
    results+=($(echo $i | cut -d "_" -f 2- | cut -d "-" -f 1 | grep -v "raw" | sed 's/_$//'))
done


# remove duplicated
samples=($(echo ${results[*]} | sed 's/ /\n/g' | sort | uniq))


# modify xml

n=1 
fasta_file=`ls $fasta_dir | grep "fasta"`          
xmlstarlet edit \
           -u '/MaxQuantParams/fastaFiles/FastaFileInfo/fastaFilePath' \
           --value "${fasta_dir}/${fasta_file}" ${n}.xml
           

for i in ${samples[@]}; do
    f1=`echo $sample_names | sed 's/ /\n/g' | grep ${i}"_-45" | grep "raw$"`
    f2=`echo $sample_names | sed 's/ /\n/g' | grep ${i}"_-70" | grep "raw$"`
    f_length=`echo $f1 | awk -F " " '{print NF}'`
    if (( ${f_length} == "1" ))
    then
        m=$((n+1))
        xmlstarlet ed --omit-decl \
            --subnode /MaxQuantParams/filePaths \
            --type elem \
            -n string \
            -v "${raw_dir}/${f1}" \
            --subnode /MaxQuantParams/filePaths \
            --type elem \
            -n string \
            -v "${raw_dir}/${f2}" \
            --subnode /MaxQuantParams/experiments \
            --type elem \
            -n string \
            -v "${i}" \
            --subnode /MaxQuantParams/experiments \
            --type elem \
            -n string \
            -v "${i}" \
            --subnode /MaxQuantParams/fractions \
            --type elem \
            -n short \
            -v 1 \
            --subnode /MaxQuantParams/fractions \
            --type elem \
            -n short \
            -v 3 \
            --subnode /MaxQuantParams/ptms \
            --type elem \
            -n boolean \
            -v False \
            --subnode /MaxQuantParams/ptms \
            --type elem \
            -n boolean \
            -v False \
            --subnode /MaxQuantParams/paramGroupIndices \
            --type elem \
            -n int \
            -v 0 \
            --subnode /MaxQuantParams/paramGroupIndices \
            --type elem \
            -n int \
            -v 0 \
            --subnode /MaxQuantParams/referenceChannel \
            --type elem \
            -n string \
            -v "" \
            --subnode /MaxQuantParams/referenceChannel \
            --type elem \
            -n string \
            -v "" \
            ${xml_dir}/${n}.xml > ${xml_dir}/${m}.xml
            n=$((n+1))
    else
        m=$((n+1))
        f1_a=`echo $f1 | awk -F " " '{print $1}'`
        f2_a=`echo $f2 | awk -F " " '{print $1}'`
        xmlstarlet ed --omit-decl \
            --subnode /MaxQuantParams/filePaths \
            --type elem \
            -n string \
            -v "${raw_dir}/${f1_a}" \
            --subnode /MaxQuantParams/filePaths \
            --type elem \
            -n string \
            -v "${raw_dir}/${f2_a}" \
            --subnode /MaxQuantParams/experiments \
            --type elem \
            -n string \
            -v "${i}" \
            --subnode /MaxQuantParams/experiments \
            --type elem \
            -n string \
            -v "${i}" \
            --subnode /MaxQuantParams/fractions \
            --type elem \
            -n short \
            -v 1 \
            --subnode /MaxQuantParams/fractions \
            --type elem \
            -n short \
            -v 3 \
            --subnode /MaxQuantParams/ptms \
            --type elem \
            -n boolean \
            -v False \
            --subnode /MaxQuantParams/ptms \
            --type elem \
            -n boolean \
            -v False \
            --subnode /MaxQuantParams/paramGroupIndices \
            --type elem \
            -n int \
            -v 0 \
            --subnode /MaxQuantParams/paramGroupIndices \
            --type elem \
            -n int \
            -v 0 \
            --subnode /MaxQuantParams/referenceChannel \
            --type elem \
            -n string \
            -v "" \
            --subnode /MaxQuantParams/referenceChannel \
            --type elem \
            -n string \
            -v "" \
            ${xml_dir}/${n}.xml > ${xml_dir}/${m}.xml
        n=$((n+1))
        
        m=$((n+1))
        f1_b=`echo $f1 | awk -F " " '{print $2}'`
        f2_b=`echo $f2 | awk -F " " '{print $2}'`
        xmlstarlet ed --omit-decl \
            --subnode /MaxQuantParams/filePaths \
            --type elem \
            -n string \
            -v "${raw_dir}/${f1_b}" \
            --subnode /MaxQuantParams/filePaths \
            --type elem \
            -n string \
            -v "${raw_dir}/${f2_b}" \
            --subnode /MaxQuantParams/experiments \
            --type elem \
            -n string \
            -v "${i}_after" \
            --subnode /MaxQuantParams/experiments \
            --type elem \
            -n string \
            -v "${i}_after" \
            --subnode /MaxQuantParams/fractions \
            --type elem \
            -n short \
            -v 1 \
            --subnode /MaxQuantParams/fractions \
            --type elem \
            -n short \
            -v 3 \
            --subnode /MaxQuantParams/ptms \
            --type elem \
            -n boolean \
            -v False \
            --subnode /MaxQuantParams/ptms \
            --type elem \
            -n boolean \
            -v False \
            --subnode /MaxQuantParams/paramGroupIndices \
            --type elem \
            -n int \
            -v 0 \
            --subnode /MaxQuantParams/paramGroupIndices \
            --type elem \
            -n int \
            -v 0 \
            --subnode /MaxQuantParams/referenceChannel \
            --type elem \
            -n string \
            -v "" \
            --subnode /MaxQuantParams/referenceChannel \
            --type elem \
            -n string \
            -v "" \
            ${xml_dir}/${n}.xml > ${xml_dir}/${m}.xml
        n=$((n+1))       
    fi
done


# run maxquant
## dotnet /home/xiwenz/software/MaxQuant_2.0.1.0/bin/MaxQuantCmd.exe mqpar.xml



