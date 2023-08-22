#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: Search for CMs in FASTA file

baseCommand: [cmsearch, -o, /dev/null]

hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/infernal:1.1.4--pl5321h031d066_4

arguments:
  - prefix: --tblout
    valueFrom: $(inputs.dna.nameroot).rRNA.tbl

inputs:
  evalue:
    type: string
    inputBinding:
      position: 1
      prefix: -E
  cms:
    type: File
    inputBinding:
      position: 2
  dna:
    type: File
    inputBinding:
      position: 3

outputs:
  tbl:
    type: File
    outputBinding: 
      glob: "*.tbl"

stdout: stdout.txt
