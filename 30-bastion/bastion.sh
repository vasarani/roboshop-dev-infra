#!/bin/bash

growpart /dev/nvme0n1p 4

lvextend -p -L+30G /dev//dev/mapper/RootVG-homeVol 
xfs_growfs /home


