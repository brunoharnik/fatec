package view;

import java.awt.Color;

import javax.swing.BoxLayout;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import model.Convidado;

public class PainelLista extends JPanel {
	
	private JScrollPane painelScroll;
	private JPanel conteudo;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// public PainelLista() {
	//
	// setPreferredSize(new Dimension(880, 720));
	//
	// listaView = new JTextArea();
	// painelRolagem = new JScrollPane(listaView);
	//
	// listaView.setFont(new Font("Trebuchet MS", Font.BOLD, 11));
	// listaView.setBackground(new Color(46,41,79));
	// listaView.setForeground(Color.WHITE);
	// listaView.setEditable(false);
	// listaView.setEnabled(true);
	//
	//
	// painelRolagem.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
	// painelRolagem.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
	// painelRolagem.setBackground(Color.BLACK);
	//
	// setLayout(new BorderLayout());
	// setBackground(new Color(46,41,79));
	// add(painelRolagem, BorderLayout.CENTER);
	//
	// setVisible(true);
	// }

	public PainelLista(Convidado[] convidados) {
		setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
		setBackground(new Color(46,41,79));
		
		conteudo = new JPanel();
		painelScroll = new JScrollPane(conteudo);
		
		add(painelScroll);

		
		setVisible(true);

	}
	
	public void setConteudo(CelulaConvidado c) {
		conteudo.add(c);
	}
	
	public void iniciaConteudo() {
		conteudo = new JPanel();
		conteudo.setLayout(new BoxLayout(conteudo, BoxLayout.Y_AXIS));
		
		painelScroll = new JScrollPane(conteudo);
		add(painelScroll);
	}
	
}
