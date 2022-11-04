##bin/bash/agvic 
##Run out of indivicual Guppy-barcoded folders- no need to specify what file it is given that the only files in the folder is wanted##

blastn -query /home/agvic/Documents/Ellen/MinION/AIV/BC02.fasta -db /home/agvic/Documents/Databases/Australian_Select_16_plusextra/Australian_Seq.fasta -outfmt "6 qseqid sseqid evalue pident stitle" -evalue 0.00001 -out BC02.txt

seqtk subseq /home/agvic/Documents/Ellen/MinION/AIV/BC02.fastq BC02.txt > BC02_mapped.fastq 

seqtk seq -A BC02_mapped.fastq > BC02_mapped.fasta 

awk '/^>/{f=!d[$1];d[$1]=1}f' BC02_mapped.fasta > BC02_norepeats.fasta

/home/agvic/Downloads/CAP3/cap3 BC02_norepeats.fasta -p 90 

/home/agvic/Downloads/CAP3/cap3 BC02_norepeats.fasta.cap.contigs assemble 

/home/agvic/Downloads/CAP3/cap3 BC02_norepeats.fasta.cap.contigs.cap.contigs assemble 

blastn -query all_pass_BC02.fasta -db /home/agvic/Documents/Databases/Ducks_COI/Bird_COI_reference_spp_only.fasta -outfmt "6 qseqid sseqid evalue pident stitle" -evalue 0.00001 -out BC01_duckie_test.txt




