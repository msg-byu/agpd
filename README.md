# SOAP and MTP as Machine-learned Alloy Models Paper

This repository stores the data and machine-learned models for the AgPd system as
published in `Machine-Learned Interatomic Potentials for Alloys`.

## Potentials

- **gap**: has the final GAP model (`mb.xml`) from the paper, the XYZ training file used to
  create it as well as the bash jobfile to execute with GAP parameters. This allows
  the potential to be recreated independently.
- **mtp**: has the final MTP model (`final.mtp`) used in the paper. The CFG
  file used by the `mlp` source code is there as well with the bash jobfile
  needed to recreate the potential.

## Phonons

The frozen phonon configurations needed to generate the phonon plots are in the
`phonons` folder. For each one, we have the XYZ file of DFT calculations, the
resulting `FORCE_CONSTANTS` file as well as the `disp.yaml` and `band.yaml` files
produced by `phonopy`.

## Data

The `data` folder has XYZ files for all the additional data created during the
project for validation or discovery.

- **bcc.xyz** has 775 enumerated BCC configurations selected IID within the
  Cluster Expansion basis.
- **fcc.xyz** has 775 enumerated FCC configurations selected IID within the
  Cluster Expansion basis.
- **pathway.xyz** has the 11 images for the transition pathway discussed in
  the paper.
- **unrelaxed.xyz** has 65 unrelaxed enumerated structures that are seeds for
  the phonon calculations.
- **relaxed.xyz** has the relaxed versions of `unrelaxed.xyz`.
