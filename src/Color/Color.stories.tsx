import React from "react";
import { storiesOf } from "@storybook/react";

import ColorGrid from "./Color.grid";
import Group from "../Shared/Constants/Group";

/**
 * see https://ether.thescenery.co/color/
 */

const layout = [
  {
    title: "$dark",
    color: "#0F1D2B"
  },
  {
    title: "$dark-85",
    color: "#3F4F5F"
  },
  {
    title: "$dark-75",
    color: "#5B6B7C"
  },
  {
    title: "$dark-50",
    color: "#91A3B0"
  },
  {
    title: "$light-110",
    color: "#B6C7D4"
  },
  {
    title: "$light",
    color: "#E2EAF0"
  },
  {
    title: "$light-90",
    color: "#EFF4F8"
  },
  {
    title: "$white",
    color: "#FFFFFF"
  }
];

storiesOf(Group.COLOURS, module).add("Layout", () => (
  <ColorGrid layout={layout} />
));
