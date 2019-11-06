import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;

public abstract class GraphDemo extends JFrame implements ActionListener {

	
	
	/**
	 * The teal panel on which things are drawn
	 */
	protected JPanel drawingPanel;

		
	/**
	 * 
	 * @param fileName
	 *            name of file containing city information
	 */
	protected abstract void loadCities(String fileName);

	/**
	 * 
	 * @param fileName
	 *            name of file containing route information
	 */
	protected abstract void loadRoutes(String fileName);

	
	public GraphDemo() {
		setTitle("Route Viewer 1.0");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		
		Container cp = getContentPane();
		cp.setLayout(new BorderLayout());

		drawingPanel = makeDrawingPanel();
		drawingPanel.setDoubleBuffered(true);

		cp.add(drawingPanel, BorderLayout.CENTER);

		buildMenu();

		pack();
		
		setVisible(true);
	}

	public void paint(Graphics g) {
		super.paint(g);
		
		Graphics g1 = drawingPanel.getGraphics();
		int w = drawingPanel.getWidth();
		int h = drawingPanel.getHeight();
		
		g1.setFont(new Font("Arial", Font.BOLD, 18));
		g1.drawString("AVIATION MAPPER", w/2-100 , 30);	
		
		int dx = 75;
		int dy = 75;
		for(int x = 0; x <= w-dx; x+= dx)
			g1.drawLine(x, 0, x, h);
		
		for(int y = 0; y <= h-dy; y+= dy)
			g1.drawLine(0, y, w, y);
	}
	
	public void actionPerformed(ActionEvent e) {
	
		String s = e.getActionCommand();
	
		if (s.equals("Load Cities")) {
	
			String fileName = locateFile();
			if (fileName != null) {
	
				loadCities(fileName);
			}
		} else if (s.equals("Load Routes")) {
	
			String fileName = locateFile();
			if (fileName != null) {
				loadRoutes(fileName);
			}
		} else if (s.equals("Exit"))
			System.exit(0);
	}

	private void buildMenu() {
		JMenuBar menuBar = new JMenuBar();
		JMenu fileMenu = new JMenu("File");

		fileMenu.add(createMenuItem("Load Cities"));

		fileMenu.add(createMenuItem("Load Routes"));

		fileMenu.add(createMenuItem("Exit"));

		menuBar.add(fileMenu);

		setJMenuBar(menuBar);

	}

	private JMenuItem createMenuItem(String name) {
		JMenuItem menuItem = new JMenuItem(name);
		menuItem.addActionListener(this);

		return menuItem;
	}

	private JPanel makeDrawingPanel() {
		// TODO Auto-generated method stub
		JPanel p = new JPanel();
		p.setPreferredSize(new Dimension(900, 700));
		Color uncw = new Color(0, 128, 128);
		p.setBackground(uncw);

		return p;
	}

	private String locateFile() {
		JFileChooser jfc = new JFileChooser();
		String fileName = null;
		int ret = jfc.showOpenDialog(this);
		if (ret == JFileChooser.APPROVE_OPTION) {
			fileName = jfc.getSelectedFile().getPath();
		}

		return fileName;
	}

	private static final long serialVersionUID = 1L;
}