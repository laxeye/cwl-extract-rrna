#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: Workflow

label: rRNA and ITS extraction from genomes

requirements:
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}

inputs:
  dna: File
  cms: File
  evalue: string

outputs:
  rrna:
    type: File
    outputSource: fetch/fasta
    label: Results of esl-sfetch
  tbl:
    type: File
    outputSource: cmsearch/tbl
    label: Results of cmsearch

steps:
  cmsearch:
    run: cmsearch.cwl
    in:
      dna: dna
      cms: cms
      evalue: evalue
    out: [tbl]
  awk:
    run: awk.cwl
    in: 
      tbl: 
        source: cmsearch/tbl
    out: [coords]
  index:
    run: index.cwl
    in:
      dna: dna
    out: [ssi]
  fetch:
    run: esl-sfetch.cwl
    in:
      coords:
        source: awk/coords
      ssi:
        source: index/ssi
    out: [fasta]
