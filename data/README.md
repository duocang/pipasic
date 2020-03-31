--------------------------
 pipasic Example/Toy Data
--------------------------


Description
-----------

This diretory contains a small example to try out pipasic. It contains one 
metaproteomic dataset with 10001 spectra and two reference proteomes. The two 
proteomes have some similarity, such that the abundance correction is applicable
here.




Contents
--------

Metaproteomic dataset in MGF format containing 10001 spectra:
data/dataset.mgf

Reference proteome databases (fasta format):
ref/species1.fasta
ref/species2.fasta

Reversed decoy databases (fasta format):
ref/species1_decoy.fasta
ref/species2_decoy.fasta


Running pipasic
---------------

The pipasic tool does all steps with one call: spectra identification (Inspect),
similarity estimation, and abundance correction. For preparation, create a 
directory called example/ in the main pipasic directory and copy the ref/ and
data/ directory there. Let us assume that the path to your Inspect installation
is /path/to/inspect/.

Now run pipasic by calling
python pipasic.py dataset species1,species2 -s example/data/ -d example/ref/ -I -i /path/to/inspect/ -o example/test_results -V

-s sets the directory to search for the mgf file "dataset" (the extension .mgf 
   is omitted in the call)
-d sets the directory to search for the fasta files containing the reference 
   proteomes and decoy databases (the extension and _decoy appendix omitted)
-I tells pipasic to use Inspect to identify all spectra in the references
-i sets the location of inspect
-o tells pipasic where to write the output files
-V creates PDF output


Data origin
-----------

This is a part of the Acid Mine Drainage data we used in section 3.2: "Acid 
Mine Drainage Experiment" in the pipasic publication. Please find more details
on this data in the pipasic publication and the original publication:

Denef, V., Kalnejais, L., Mueller, R., Wilmes, P., Baker, B., Thomas, B.,
VerBerkmoes, N., Hettich, R., and Banfield, J. (2010). Proteogenomic basis
for ecological divergence of closely related bacteria in natural acidophilic 
microbial communities. Proc. Natl. Acad. Sci. USA, 107(6), 2383–2390.