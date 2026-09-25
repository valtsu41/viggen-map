Map {
    background-color: black;
}

#sea {
  polygon-fill: gray;
  polygon-simplify: 15;
  polygon-simplify-algorithm: visvalingam-whyatt;
  polygon-smooth: 0.5;
}

#water[fclass = "water"] {
  polygon-fill: gray;
  polygon-simplify: 15;
  polygon-simplify-algorithm: visvalingam-whyatt;
  polygon-smooth: 0.5;
}

#urban {
  polygon-fill: chocolate;
  polygon-simplify: 15;
  polygon-simplify-algorithm: visvalingam-whyatt;
  polygon-smooth: 0.5;
}

#urban::outline {
  line-color: black;
  line-width: 1;
  line-simplify: 15;
  line-simplify-algorithm: visvalingam-whyatt;
  line-smooth: 0.5;
}

#railways[fclass = "rail"][tunnel = "F"][zoom >= 8] {
  line-color: saddlebrown;
  line-width: 1;
  line-simplify: 15;
  line-smooth: 0.5;

  marker-placement: line;
  marker-file: "symbols/sleeper.svg";
  marker-spacing: 5;
}

#roads {
  [zoom >= 6] {
    [fclass = "motorway"], [fclass = "trunk"] {
      line-color: dimgray;
      line-cap: square;
      line-simplify: 0;
      line-smooth: 0.5;
      line-width: 2;
    }
  }
  [zoom >= 8] {
    [fclass = "primary"] {
      line-color: dimgray;
      line-cap: square;
      line-simplify: 0;
      line-smooth: 0.5;
      line-width: 1;
    }
  }
}

#powerlines[zoom >= 9] {
  line-color: dimgray;
  line-dasharray: 20, 6
}

#adminareas::outline[fclass = "national"] {
  line-color: dimgray;
  line-width: 2;
  line-dasharray: 30, 40;
  plus-a/marker-placement: line;
  plus-a/marker-spacing: 70;
  plus-a/marker-spacing-offset: 45;
  plus-a/marker-file: "symbols/plus.svg";
  plus-b/marker-placement: line;
  plus-b/marker-spacing: 70;
  plus-b/marker-spacing-offset: 55;
  plus-b/marker-file: "symbols/plus.svg";
}

#churches[zoom >= 10] {
  marker-file: "symbols/church.svg";
}