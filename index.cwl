#!/usr/bin/env cwl-runner
cwlVersion: v1.1
class: CommandLineTool

label: Index input FASTA file

requirements:
  InitialWorkDirRequirement:
    listing: 
      - $(inputs.dna)

baseCommand: [esl-sfetch]

hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/easel:0.49--h031d066_0

inputs:
  dna:
    type: File
    inputBinding:
      position: 1
      prefix: --index

outputs:
  ssi:
    type: File
    secondaryFiles: .ssi
    outputBinding: 
      glob: $(inputs.dna.basename)

stdout: stdout.txt
