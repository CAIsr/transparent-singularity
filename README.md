### See https://github.com/NeuroDesk/transparent-singularity for updates

---

https://github.com/NeuroDesk/transparent-singularity

This project allows to use singularity containers transparently on HPCs, so that an application inside the container can be used without adjusting any scripts or pipelines (e.g. nipype). 

## Important: add bind points to .bashrc before executing this script
This script expects that you have adjusted the Singularity Bindpoints in your .bashrc, e.g.:
```
export SINGULARITY_BINDPATH="/gpfs1/,/QRISdata,/data"
```

## This gives you a list of all tested images available in neurodesk:
https://github.com/NeuroDesk/neurodesk/blob/master/cvmfs/log.txt
```
curl -s https://raw.githubusercontent.com/NeuroDesk/neurodesk/master/cvmfs/log.txt
```

## Clone repo into a folder with the intented image name
```
git clone https://github.com/NeuroDesk/transparent-singularity convert3d_1.0.0_20210104
```

## Install
This will create scripts for every binary in the container located in the $DEPLOY_PATH inside the container. It will also create activate and deactivate scripts and module files for lmod (https://lmod.readthedocs.io/en/latest/)
```
cd convert3d_1.0.0_20210104
./run_transparent_singularity.sh --container convert3d_1.0.0_20210104
```

# Use in module system LMOD
Add the module folder path to $MODULEPATH

# Manual activation and deactivation (in case module system is not available). This will add the paths to the .bashrc
## Activate
```
source activate_convert3d_1.0.0_20210104.sh
```

## Deactivate
```
source deactivate_convert3d_1.0.0_20210104.sif.sh
```

## Uninstall container and cleanup
```
./ts_uninstall.sh
```
