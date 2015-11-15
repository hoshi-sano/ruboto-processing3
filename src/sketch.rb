class Sketch < PApplet
  import org.ruboto.Log

  def ruboto_log
    Log
  end

  def setup
    ruboto_log.d "displayWidth: " + displayWidth.to_s
    ruboto_log.d "displayHeight: " + displayHeight.to_s

    @pg = create_graphics(100, 100)
    @img_1 = load_image("weapon.png")
    @img_2 = load_image("potion.png")
  end

  def draw
    background(150)
    stroke(0, 0, 0)
    rect(100, 100, 100, 100)
    stroke(125, 0, 0)
    rect(200, 200, 100, 100)
    stroke(255, 0, 0)
    ellipse(300, 300, 100, 100)

    @pg.begin_draw()
    @pg.background(100)
    @pg.stroke(255)
    @pg.line(@pg.width * 0.5, @pg.height * 0.5, mouseX, mouseY)
    @pg.end_draw()
    image(@pg, 0, 0)

    image(@img_1, 50, 300)
    image(@img_2, 50, 350)
  end

  def mousePressed
    rect(300, 300, 100, 100)
  end

  def mouseReleased
    rect(300, 400, 100, 100)
  end
end
