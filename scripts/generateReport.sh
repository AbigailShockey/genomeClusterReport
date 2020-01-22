#!/bin/bash

usage() {
  echo "Generate a genomic clustering report using R Markdown."
  echo "Usage:"
  echo "      generateReport.sh <options>"
  echo "Options:"
  echo "      Required"
  echo "      -s      Genus and Species eg. \"Escherichia coli\""
  echo "      -n      Number of isolates"
  echo "      -m      SNP matrix file name"
  echo "      -tr     Newick tree file"
  echo "      Optional"
  echo "      -o      Output path: defaults to /data/"
}


output_path="/data/"
species=""
n_isolates=""
snp_table=""
nwk_tree=""

while (( "$#" )); do
  case "$1" in
    -o|--output-path)
      output_path=$2
      shift 2
      ;;
    -s|--species)
      species=$2
      shift 2
      ;;
    -n|--num-isolates)
      n_isolates=$2
      shift 2
      ;;
    -m|--snp-matrix)
      snp_table=$2
      shift 2
      ;;
    -tr|--phylogenetic-tree)
      nwk_tree=$2
      shift 2
      ;;
    --) # end argument parsing
      shift
      break
      ;;
    -*|--*=|*) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [ -z $species ] || [ -z $n_isolates ]; then
  usage
  exit 1
fi

cp -u /scripts/report.Rmd $output_path

Rscript /scripts/render.R "$output_path" "$species" "$n_isolates" "$snp_table" "$nwk_tree"
