import React from "react";

import * as styles from "./Color.grid.scss";

interface Layout {
  title: string;
  color: string;
}

interface ColorGridProps {
  layout: Layout[];
}

const Colour = ({ color, title }: Layout) => (
  <div style={{ backgroundColor: color }} className={styles.color}>
    <label className={styles.label}>{`${title}: ${color}`}</label>
  </div>
);

const ColorGrid = ({ layout }: ColorGridProps) => {
  return (
    <div className={styles.container}>
      <div className={styles.head}>
        <Colour title={layout[0].title} color={layout[0].color} />
      </div>

      <div className={styles.body}>
        {layout.slice(1).map(l => {
          return <Colour title={l.title} color={l.color} />;
        })}
      </div>
    </div>
  );
};

export default ColorGrid;
