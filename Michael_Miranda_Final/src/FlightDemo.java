import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;

public class FlightDemo extends GraphDemo implements MouseListener{
	private ArrayList<Airport> airports = new ArrayList<>();
	private ArrayList<Route> routes = new ArrayList<>();
	
	public FlightDemo() {
		drawingPanel.addMouseListener(this);
	}

	@Override
	protected void loadCities(String fileName) {
		// TODO Auto-generated method stub
		try {
			ArrayList<Airport> ports = readCities(fileName);
			airports = ports;
			for (Airport a: ports)
				this.drawAirport(a);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	protected void loadRoutes(String fileName) {
		// TODO Auto-generated method stub
		try {
			ArrayList<Route> route = readRoutes(fileName);
			routes = route;
			for (Route r: route) {
				this.drawRoute(r);
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void main(String [] args) {
		FlightDemo fd = new FlightDemo();
		fd.setVisible(true);
	}
	
	private ArrayList<Airport> readCities(String file) throws IOException {
		ArrayList<Airport> a = new ArrayList<>();
		RandomAccessFile raf = new RandomAccessFile(file,"r");
		String line = raf.readLine();
		while (line != null) {
			String [] x = line.split(" ");
			int temp1 = Integer.parseInt(x[3]);
			int temp2 = Integer.parseInt(x[4]);
			Airport i = new Airport(x[0], x[1], x[2],temp1, temp2);
			a.add(i);
			line = raf.readLine();
		}
		raf.close();
		return a;
		
	}
	
	private ArrayList<Route> readRoutes(String file) throws IOException {
		ArrayList<Route> r = new ArrayList<>();
		RandomAccessFile raf = new RandomAccessFile(file,"r");
		String line = raf.readLine();
		while (line != null) {
			String [] x = line.split(" ");
			Route i = new Route(x[0], x[1], x[2]);
			r.add(i);
			line = raf.readLine();
		}
		raf.close();
		return r;
	}
	
	private void drawAirport(Airport a) {
		Graphics g = drawingPanel.getGraphics();
		a.draw(g);
	}
	
	private void drawRoute(Route r) {
		Graphics g = drawingPanel.getGraphics();
		g.setColor(Color.RED);
		int [] points = new int[4];
		for (Airport a: airports) {
			if (a.getCode().equals(r.getStart())) {
				points[0] = a.getX();
				points[1] = a.getY();
			}
			else if (a.getCode().equals(r.getEnd())) {
				points[2] = a.getX();
				points[3] = a.getY();
			}	
		}
		g.drawLine(points[0], points[1], points[2], points[3]);
	}
	public void paint(Graphics g) {
		super.paint(g);
		
		Graphics g1 = drawingPanel.getGraphics();
		for (Airport a: airports)
			a.draw(g1);
		for (Route r: routes)
			this.drawRoute(r);
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		boolean shiftPressed = ((e.getModifiers() & MouseEvent.SHIFT_MASK) != 0);
		if (shiftPressed) {
			int tempx = e.getX();
			int tempy = e.getY();
			double d = 24;
			for (Airport a: airports) {
				if (tempx >= a.getX() & tempx <= a.getX()+10 & tempy >= a.getY() & tempy <= a.getY()+10)
					for (Route r: routes) {
						if (a.getCode().equals(r.getStart()) & r.getTime() < d)
							d = r.getTime();
						else
							continue;
					}
				for (Route r: routes) {
					if(r.getTime() == d)
						for (Airport b: airports) {
							if(r.getEnd().equals(b.getCode()))
								System.out.println(b.getCity()+","+b.getState());
						}
				}
			}		
		}
		else {
			int tempx = e.getX();
			int tempy = e.getY();
			for (Airport a: airports) {
				if (tempx >= a.getX() & tempx <= a.getX()+10 & tempy >= a.getY() & tempy <= a.getY()+10)
					System.out.println(a.getCity()+","+a.getState());
			}
		}
		this.paint(drawingPanel.getGraphics());
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

		
	}

