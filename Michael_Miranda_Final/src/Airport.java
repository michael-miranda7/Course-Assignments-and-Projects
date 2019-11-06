import java.awt.Color;
import java.awt.Graphics;

public class Airport {
	private int xcoor, ycoor;
	private String city, state, code;
	
	public Airport(String c, String s, String code, int x, int y) {
		xcoor = x;
		ycoor = y;
		city = c;
		state = s;
		this.code = code;
	}
	
	public int getX() {
		return xcoor;
	}
	public int getY() {
		return ycoor;
	}
	
	public String toString() {
		return code + "(" + xcoor + "," + ycoor + ")";
	}
	
	public void draw(Graphics g) {
		g.setColor(Color.RED);
		g.drawRect(xcoor,ycoor, 10, 10);
		g.drawString(this.toString(), xcoor+10, ycoor);
		
	}
	
	public String getCity() {
		return city;
	}
	
	public String getState() {
		return state;
	}
	
	public String getCode() {
		return code;
	}

}
