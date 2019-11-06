
public class Route {
	private String start, end;
	private double time;
	
	public Route(String s, String e, String t) {
		start = s;
		end = e;
		time = setTime(t);
	}
	
	public String getStart() {
		return start;
	}
	
	public String getEnd() {
		return end;
	}
	
	public double setTime (String t) {
		String [] x = t.split(":");
		String y = x[0] + "." + x[1];
		double d = Double.parseDouble(y);
		return d;
	}
	
	public double getTime() {
		return time;
	}
	

}
