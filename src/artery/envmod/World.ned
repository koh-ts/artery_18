//
// Artery V2X Simulation Framework
// Copyright 2014-2017 Hendrik-Joern Guenther, Raphael Riebl, Oliver Trauer
// Licensed under GPLv2, see COPYING file for detailed license and warranty terms.
//

package artery.envmod;

import artery.envmod.GlobalEnvironmentModel;
import artery.envmod.LocalEnvironmentModel;
import artery.inet.World;
import artery.utility.IdentityRegistry;
import org.car2x.veins.base.modules.BaseWorldUtility;

network World extends artery.inet.World
{
    parameters:
        **.globalEnvironmentModule = default("environmentModel");
        double playgroundSizeX @unit(m); // x size of the area the nodes are in (in meters)
        double playgroundSizeY @unit(m); // y size of the area the nodes are in (in meters)
        double playgroundSizeZ @unit(m); // z size of the area the nodes are in (in meters)

    submodules:
        environmentModel: GlobalEnvironmentModel {
            parameters:
                @display("p=140,20");
                identityRegistryModule = default("idRegistry");
                traciModule = default("traci");
                nodeMobilityModule = default(".mobility");
        }

        idRegistry: IdentityRegistry {
            parameters:
                @display("p=180,20");
        }
        world: BaseWorldUtility {
            parameters:
                playgroundSizeX = playgroundSizeX;
                playgroundSizeY = playgroundSizeY;
                playgroundSizeZ = playgroundSizeZ;
                @display("p=210,210");
        }
}
