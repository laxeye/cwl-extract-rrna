# eerRNA 
CWL tool to **e**xtract **e**ukaryotic **rRNA** from genome assembly

## How to use

At first You need any [CWL implementation](https://www.commonwl.org/implementations/), [cwltool](https://github.com/common-workflow-language/cwltool) is OK. 

***eerRNA*** uses ***cmsearch*** from [Infernal](https://github.com/EddyRivasLab/infernal) to search ***Rfam*** covariance models and [***easel***](https://github.com/EddyRivasLab/easel) to extract sequences. Their images will be automaticly pulled from quay.io. If You don't like Docker You should install both tools, eg. via conda, and run `cwltool` with `--no-container` option.

### Test run

`cwltool extract-euk-rrna.cwl test.yml`
