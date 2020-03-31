-------------------------------------------------------------------------------
 Pipasic - peptide intensity-weighted proteome abundance similarity correction
-------------------------------------------------------------------------------


Abstract
--------

Metaproteomic analysis allows studying the interplay of organisms or functional 
groups and has become increasingly popular also for diagnostic purposes. 
However, difficulties arise due to the high sequence similarity between related 
organisms. Further, the state of conservation of proteins between species can 
be correlated with their expression level which can lead to significant bias in 
results and interpretation. These challenges are similar but not identical to 
the challenges arising in the analysis of metagenomic samples and require 
specific solutions.
We developed Pipasic (peptide intensity-weighted proteome abundance similarity 
correction) as a tool which corrects identification and spectral counting based 
quantification results using peptide similarity estimation and expression level 
weighting within a non-negative lasso framework. pipasic has distinct advantages 
over approaches only regarding unique peptides or aggregating results to the 
lowest common ancestor, as demonstrated on examples of viral diagnostics and an 
acid mine drainage dataset.


Requirements
------------

Pipasic was developed with Python 2.7.2, the following python libraries are 
required:

- Biopython 1.60
- NumPy 1.7.1
- matplotlib 1.2.1 (optional for graphical output)

Pipasic might be able to work with different software versions, but we tested 
it using the given configuration.

Spectrum identification can be done with Inspect or Tide. We used the following
versions:

- InsPecT version 20100804
- Tide as part of Crux 1.36


Installation
------------

Pipasic is a Python tool and does not require any installation (except the
requirements above). Download the source code or check out the repository and
run Pipasic from the command line by calling

> python pipasic.py

See below for more details.


Usage
-----

Usage: pipasic.py SPECTRA DB [module options] [input and configuration options]

Overall pipasic calling tool, including:
- weighted (always) and unweighted (optional) similarity estimation
- correction, using matrix from similarity estimation
- peptide Identification by InsPecT/Tide

SPECTRA: Comma-separated string of spectrum files (mgf) - without file-extension!
DB:      Comma-separated string of reference proteomes (fasta-files) - without file-extension!
         if -S or -I: decoy database must exist as db_name+"_decoy.fasta"

Note: Pipasic requires two .fasta for each reference proteome <ref>:
- "<ref>.fasta" containing the protein sequences only.
- "<ref>_decoy.fasta" containing BOTH the protein AND decoy sequences. Decoy
  sequences must be tagged in their name with "REVERSED" or "DECOY" or any
  other tag specified by "-t".


Options:
  -h, --help            show this help message and exit
  -U, --Unweighted      calculate unweighted similarities for all given
                        proteomes
  -I, --Identify        identify given spectra with all given proteomes
  -T, --Tide            use Tide instead of InsPecT
  -V                    Visualize results using matplotlib
  -o OUTFILE, --outfile=OUTFILE
                        Output filename for results. Also serves as trunk for
                        other result files (graphics, data).  [default:
                        results.txt]
  -s SPEC_DIR, --spec_dir=SPEC_DIR
                        Directory of SPECTRA (mgf) files. Search in current
                        directory, if not given. [default: none]
  -d DB_DIR, --db_dir=DB_DIR
                        Directory of proteinDBs. Search for DB files current
                        directory, if not given. [default: none]
  -m MODS, --mods=MODS  A string containing all modifications in question,
                        modification choice by filename if not given.
                        [default: none]
  -i INSP_DIR, --inspect_dir=INSP_DIR
                        Inspect directory. [default: none]
  -f FDR, --fdr_cutoff=FDR
                        False discovery rate cut-off for identification lists.
                        [default: 0.05]
  -t DECOY_TAG, --decoy_tag=DECOY_TAG
                        Tag to identify decoy sequences in the database.
                        Regular expressions may be used. This tag must be used
                        in the name of all decoy sequences in the file
                        "<DB>_decoy.fasta". [default: REVERSED|DECOY]
  -l LABELS, --labels=LABELS
                        Comma-separated string of short names for organisms in
                        the reference proteomes. If not given, the file name
                        is used. [default: none]
  -N N, --N_spectra=N   Number of spectra in original dataset, comma-separated
                        list if multiple datasets. [default: none]
  -c COUNTS, --C_spectra=COUNTS
                        File containing numbers of spectra found by
                        identification (Numpy Array dump). [default: none]
  -q, --quiet           don't print status messages to stdout



Example run
-----------

Download the example dataset from Sourceforge!
https://sourceforge.net/projects/pipasic/files/example.tar.gz/download

Extract the archive into your pipasic installation and follow the instructions
in example/README.


License
-------

pipasic is Open Source! Please find detailed licensing information in the
LICENSE file.


Contact
-------

Please contact Bernhard Renard (renardb@rki.de) if you have questions 
concerning Pipasic.

