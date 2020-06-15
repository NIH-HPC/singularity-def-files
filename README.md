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
- [abruijn](/high-throughput-sequencing/abruijn)
- [AscatNGS](/high-throughput-sequencing/ascatngs)
- [ATAC-Seq / DNase-Seq Pipeline](/high-throughput-sequencing/atac_dnase_pipelines)
- [Atropos](/high-throughput-sequencing/atropos)
- [bamliquidator](/high-throughput-sequencing/bamliquidator)
- [BAMSurgeon](/high-throughput-sequencing/bamsurgeon)
- [bigscale2](/high-throughput-sequencing/bigscale2)
- [bison](/high-throughput-sequencing/bison)
- [BRASS](/high-throughput-sequencing/brass)
- [cancerit-wgs](/high-throughput-sequencing/cancerit-wgs)
- [Canvas](/high-throughput-sequencing/canvas)
- [cellsnp](/high-throughput-sequencing/cellsnp)
- [cgpBattenberg](/high-throughput-sequencing/cgpbattenberg)
- [csvkit](/high-throughput-sequencing/csvkit)
- [deeptools](/high-throughput-sequencing/deeptools)
- [deepvariant](/high-throughput-sequencing/deepvariant)
- [dropest](/high-throughput-sequencing/dropest)
- [eager](/high-throughput-sequencing/eager)
- [epic2](/high-throughput-sequencing/epic2)
- [flappie](/high-throughput-sequencing/flappie)
- [flye](/high-throughput-sequencing/flye)
- [gossamer](/high-throughput-sequencing/gossamer)
- [guppy](/high-throughput-sequencing/guppy)
- [hail](/high-throughput-sequencing/hail)
- [hap.py](/high-throughput-sequencing/hap.py)
- [hicpro](/high-throughput-sequencing/hicpro)
- [htseq](/high-throughput-sequencing/htseq)
- [humann2](/high-throughput-sequencing/humann2)
- [idep](/high-throughput-sequencing/idep)
- [lefse](/high-throughput-sequencing/lefse)
- [mageck-vispr](/high-throughput-sequencing/mageck-vispr)
- [metabat](/high-throughput-sequencing/metabat)
- [mitosuite](/high-throughput-sequencing/mitosuite)
- [mtoolbox](/high-throughput-sequencing/mtoolbox)
- [neusomatic](/high-throughput-sequencing/neusomatic)
- [parliament](/high-throughput-sequencing/parliament)
- [PCAP-core](/high-throughput-sequencing/pcap-core)
- [PePr](/high-throughput-sequencing/pepr)
- [pvactools](/high-throughput-sequencing/pvactools)
- [raremetal](/high-throughput-sequencing/raremetal)
- [repeatmodeler](/high-throughput-sequencing/repeatmodeler)
- [ricopili](/high-throughput-sequencing/ricopili)
- [rmats](/high-throughput-sequencing/rmats)
- [RSD](/high-throughput-sequencing/rsd)
- [scramble](/high-throughput-sequencing/scramble)
- [seqlinkage](/high-throughput-sequencing/seqlinkage)
- [stream](/high-throughput-sequencing/stream)
- [SURPI](/high-throughput-sequencing/surpi)
- [sve](/high-throughput-sequencing/sve)
- [tandemtools](/high-throughput-sequencing/tandemtools)
- [TPMCalculator](/high-throughput-sequencing/tpmcalculator)
- [TVC](/high-throughput-sequencing/tvc)
- [VAGrENT](/high-throughput-sequencing/vagrent)
- [VEP](/high-throughput-sequencing/vep)
- [vireosnp](/high-throughput-sequencing/vireosnp)
 
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
- [xcpengine](/image-analysis/xcpengine)
 
## [Linkage Phylogenetics](/linkage-phylogenetics)
- [bali-phy](/linkage-phylogenetics/bali-phy)
- [gubbins](/linkage-phylogenetics/gubbins)
 
## [Mass Spectrometry](/mass-spectrometry)
- [maxquant](/mass-spectrometry/maxquant)
 
## [Sequence Analysis](/sequence-analysis)
- [ACFS](/sequence-analysis/acfs)
- [ANNOgesic](/sequence-analysis/annogesic)
- [ASGAL](/sequence-analysis/asgal)
- [Accurity](/sequence-analysis/accurity)
- [CRISPRAnalyzeR](/sequence-analysis/crispranalyzer)
- [EukRep](/sequence-analysis/eukrep)
- [GLU](/sequence-analysis/glu)
- [VCF-kit](/sequence-analysis/vcf-kit)
- [chipseq_pipeline](/sequence-analysis/chipseq_pipeline)
- [deepsea](/sequence-analysis/deepsea)
- [glnexus](/sequence-analysis/glnexus)
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
 
## [Utilities](/utilities)
- [ariba](/utilities/ariba)
- [atom](/utilities/atom)
- [longshot](/utilities/longshot)
- [pdf2svg](/utilities/pdf2svg)
- [snp-sites](/utilities/snp-sites)
- [sysbench](/utilities/sysbench)
- [uropa](/utilities/uropa)
- [whatshap](/utilities/whatshap)
 
