#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: Extract found rRNA

baseCommand: [esl-sfetch, -Cf]

hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/easel:0.49--h031d066_0

inputs:
  ssi:
    type: File
    inputBinding:
      position: 1
  coords:
    type: File
    inputBinding:
      position: 2

outputs:
  fasta:
    type: File
    outputBinding: 
      glob: "*.fasta"

stdout: $(inputs.ssi.nameroot).rRNA.fasta
