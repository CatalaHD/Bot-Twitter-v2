void setup() {
  size(1290, 720);

  // Background Img
  PImage back = loadImage("bg_death.jpg");
  image(back, 0, 0, width, height);

  // Logo image at the bottom right
  PImage logo = loadImage("../udg.png");
  image(logo, width-200, height-200, 200, 200);


  Table table = loadTable("../data.csv", "header");


  textSize(40);

  outlineText("MORTS", 1290/2-25, 50, true);

  translate(35, 80);

  textSize(25);

  int aux_i = 0;

  for (int i=0; i<table.getRowCount(); i++) {   
    if (aux_i >= 10) {
      translate(420, 0);
      aux_i=0;
    }

    TableRow row = table.getRow(i);

    String name = row.getString("Name");
    int viu = row.getInt("Viu");

    if (viu == 0) {
      outlineText(name, 10, 30 + aux_i*60, false);
      aux_i++;
    }
  }

  save("output_death.png");
  exit();
}


void outlineText(String text, int pos_x, int pos_y, boolean isTitle) {
  if (isTitle) { // Outline color
    fill(0);
  } else {
    fill(51);
  }

  for (int x = -1; x < 2; x++) {
    text(text, pos_x+x, pos_y);
    text(text, pos_x, pos_y+x);
  }

  if (isTitle) { // Fill color
    fill(255, 0, 0); // Red title
  } else {
    fill(255);
  }

  text(text, pos_x, pos_y);
}
