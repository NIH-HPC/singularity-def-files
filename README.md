# NIH HPC Singularity Definition Files                                                                
These definition files and wrapper scripts are used by the [NIH HPC (Biowulf)](https://hpc.nih.gov/) staff to install containerized applications using [Singularity](https://github.com/sylabs/singularity). Each app is installed in a self-contained directory and access to the app is controlled through a module system ([Lmod](https://github.com/TACC/Lmod)). This strategy allows users to transparently access apps that are installed within containers as though they were installed directly on the host system. More details can be found [here](https://hpc.nih.gov/apps/singularity.html#bind-stationary).

Typically, apps are installed under in a directory structure like so:

```
$ tree appname/ver
appname/ver
|-- bin
|   |-- cmd1 -> ../libexec/wrapper.sh
|   |-- cmd2 -> ../libexec/wrapper.sh
|   `-- cmd3 -> ../libexec/wrapper.sh
`-- libexec
    |-- app.sif
    `-- wrapper.sh
```
Because `wrapper.sh` is written to be introspective, any command symlinked to it will be carried through and executed within the associated container. The wrapper script is also sufficiently generic that it can be reused across apps with little or no modification.

Each app has its own `README.md` that contains:
- a link to the NIH HPC app page or developer's documentation
- a list of symlinks that should be created to the wrapper script to expose executables within the container
- any app specific installation notes

Finally, please note that these definition files **are not guaranteed to reproduce the same container, or even to produce any container at all**. The internet, upon which these definition files are based, is subject to change without notice. These definition files are therefore intended to be treated as (potentially) helpful suggestions.

## [Deep Learning](/deep-learning)
- [Caffe2](/deep-learning/caffe2)
- [DEXTR-PyTorch](/deep-learning/dextr-pytorch)
- [PolyRNNpp](/deep-learning/polyrnnpp)
- [basset](/deep-learning/basset)
- [clairvoyante](/deep-learning/clairvoyante)
- [deeplab](/deep-learning/deeplab)
- [digits](/deep-learning/digits)
- [few-shot-ssl](/deep-learning/few-shot-ssl)
- [tensorrt](/deep-learning/tensorrt)
- [unet](/deep-learning/unet)
 
## [High Throughput Sequencing](/high-throughput-sequencing)
- [ATAC-Seq / DNase-Seq Pipeline](/high-throughput-sequencing/atac_dnase_pipelines)
- [AscatNGS](/high-throughput-sequencing/ascatngs)
- [Atropos](/high-throughput-sequencing/atropos)
- [BAMSurgeon](/high-throughput-sequencing/bamsurgeon)
- [BRASS](/high-throughput-sequencing/brass)
- [Canvas](/high-throughput-sequencing/canvas)
- [PCAP-core](/high-throughput-sequencing/pcap-core)
- [PePr](/high-throughput-sequencing/pepr)
- [RSD](/high-throughput-sequencing/rsd)
- [SURPI](/high-throughput-sequencing/surpi)
- [TPMCalculator](/high-throughput-sequencing/tpmcalculator)
- [TVC](/high-throughput-sequencing/tvc)
- [VAGrENT](/high-throughput-sequencing/vagrent)
- [VEP](/high-throughput-sequencing/vep)
- [abruijn](/high-throughput-sequencing/abruijn)
- [bamliquidator](/high-throughput-sequencing/bamliquidator)
- [bigscale2](/high-throughput-sequencing/bigscale2)
- [bison](/high-throughput-sequencing/bison)
- [cancerit-wgs](/high-throughput-sequencing/cancerit-wgs)
- [cellsnp](/high-throughput-sequencing/cellsnp)
- [cgpBattenberg](/high-throughput-sequencing/cgpbattenberg)
- [cnvkit](/high-throughput-sequencing/cnvkit)
- [csvkit](/high-throughput-sequencing/csvkit)
- [cutadapt](/high-throughput-sequencing/cutadapt)
- [deeptools](/high-throughput-sequencing/deeptools)
- [deepvariant](/high-throughput-sequencing/deepvariant)
- [dropest](/high-throughput-sequencing/dropest)
- [eager](/high-throughput-sequencing/eager)
- [epic2](/high-throughput-sequencing/epic2)
- [flappie](/high-throughput-sequencing/flappie)
- [flye](/high-throughput-sequencing/flye)
- [fusioninspector](/high-throughput-sequencing/fusioninspector)
- [gossamer](/high-throughput-sequencing/gossamer)
- [guppy](/high-throughput-sequencing/guppy)
- [hail](/high-throughput-sequencing/hail)
- [hap.py](/high-throughput-sequencing/hap.py)
- [hicpro](/high-throughput-sequencing/hicpro)
- [htseq](/high-throughput-sequencing/htseq)
- [humann2](/high-throughput-sequencing/humann2)
- [idep](/high-throughput-sequencing/idep)
- [lefse](/high-throughput-sequencing/lefse)
- [macs](/high-throughput-sequencing/macs)
- [mageck-vispr](/high-throughput-sequencing/mageck-vispr)
- [medaka](/high-throughput-sequencing/medaka)
- [metabat](/high-throughput-sequencing/metabat)
- [metaphlan](/high-throughput-sequencing/metaphlan)
- [mitosuite](/high-throughput-sequencing/mitosuite)
- [mtoolbox](/high-throughput-sequencing/mtoolbox)
- [multiqc](/high-throughput-sequencing/multiqc)
- [neusomatic](/high-throughput-sequencing/neusomatic)
- [parliament](/high-throughput-sequencing/parliament)
- [pvactools](/high-throughput-sequencing/pvactools)
- [pychopper](/high-throughput-sequencing/pychopper)
- [raremetal](/high-throughput-sequencing/raremetal)
- [repeatmodeler](/high-throughput-sequencing/repeatmodeler)
- [ricopili](/high-throughput-sequencing/ricopili)
- [rilseq](/high-throughput-sequencing/rilseq)
- [rmats](/high-throughput-sequencing/rmats)
- [scramble](/high-throughput-sequencing/scramble)
- [seqlinkage](/high-throughput-sequencing/seqlinkage)
- [sicer](/high-throughput-sequencing/sicer)
- [slamdunk](/high-throughput-sequencing/slamdunk)
- [stream](/high-throughput-sequencing/stream)
- [sve](/high-throughput-sequencing/sve)
- [svtk](/high-throughput-sequencing/svtk)
- [taiji](/high-throughput-sequencing/taiji)
- [tandemtools](/high-throughput-sequencing/tandemtools)
- [tetoolkit](/high-throughput-sequencing/tetoolkit)
- [transvar](/high-throughput-sequencing/transvar)
- [vireosnp](/high-throughput-sequencing/vireosnp)
- [xengsort](/high-throughput-sequencing/xengsort)
 
## [Image Analysis](/image-analysis)
- [ResMap](/image-analysis/resmap)
- [TeraStitcher](/image-analysis/terastitcher)
- [baracus](/image-analysis/baracus)
- [broccoli](/image-analysis/broccoli)
- [ctf](/image-analysis/ctf)
- [deepmedic](/image-analysis/deepmedic)
- [fmriprep](/image-analysis/fmriprep)
- [minc-toolkit](/image-analysis/minc-toolkit)
- [mriqc](/image-analysis/mriqc)
- [mrtrix](/image-analysis/mrtrix)
- [qsiprep](/image-analysis/qsiprep)
- [tesseract](/image-analysis/tesseract)
- [xcpengine](/image-analysis/xcpengine)
 
## [Linkage Phylogenetics](/linkage-phylogenetics)
- [bali-phy](/linkage-phylogenetics/bali-phy)
- [gubbins](/linkage-phylogenetics/gubbins)
 
## [Mass Spectrometry](/mass-spectrometry)
- [maxquant](/mass-spectrometry/maxquant)
 
## [Mathematical/Statistics](/mathematical-statistics)
- [m2clust](/mathematical-statistics/m2clust)
 
## [Molecular Modeling Graphics](/molecular-modeling-graphics)
- [ChimeraX](/molecular-modeling-graphics/chimerax)
- [starseqr](/molecular-modeling-graphics/starseqr)
 
## [Sequence Analysis](/sequence-analysis)
- [ACFS](/sequence-analysis/acfs)
- [ANNOgesic](/sequence-analysis/annogesic)
- [ASGAL](/sequence-analysis/asgal)
- [Accurity](/sequence-analysis/accurity)
- [EukRep](/sequence-analysis/eukrep)
- [GLU](/sequence-analysis/glu)
- [HTGTSrep](/sequence-analysis/htgtsrep)
- [VCF-kit](/sequence-analysis/vcf-kit)
- [arriba](/sequence-analysis/arriba)
- [augustus](/sequence-analysis/augustus)
- [bamgineer](/sequence-analysis/bamgineer)
- [chipseq_pipeline](/sequence-analysis/chipseq_pipeline)
- [deepsea](/sequence-analysis/deepsea)
- [glnexus](/sequence-analysis/glnexus)
- [intarna](/sequence-analysis/intarna)
- [ldsc](/sequence-analysis/ldsc)
- [netOglyc](/sequence-analysis/netoglyc)
- [prokka](/sequence-analysis/prokka)
- [roary](/sequence-analysis/roary)
- [smoove](/sequence-analysis/smoove)
- [sonicparanoid](/sequence-analysis/sonicparanoid)
- [wisexome](/sequence-analysis/wisexome)
- [xHLA](/sequence-analysis/xhla)
 
## [Structural Biology](/structural-biology)
- [parsnip](/structural-biology/parsnip)
- [pymol](/structural-biology/pymol)
- [rDock](/structural-biology/rdock)
 
## [Systems Biology](/systems-biology)
- [cellphonedb](/systems-biology/cellphonedb)
 
## [Utilities](/utilities)
- [Xvfb](/utilities/xvfb)
- [ariba](/utilities/ariba)
- [atom](/utilities/atom)
- [gdc-client](/utilities/gdc-client)
- [longshot](/utilities/longshot)
- [pdf2svg](/utilities/pdf2svg)
- [snp-sites](/utilities/snp-sites)
- [sysbench](/utilities/sysbench)
- [uropa](/utilities/uropa)
- [whatshap](/utilities/whatshap)
 
