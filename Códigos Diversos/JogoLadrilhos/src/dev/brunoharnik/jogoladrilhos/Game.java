package dev.brunoharnik.jogoladrilhos;

import java.awt.Graphics;
import java.awt.image.BufferStrategy;
import java.awt.image.BufferedImage;

import dev.brunoharnik.jogoladrilhos.display.Display;
import dev.brunoharnik.jogoladrilhos.gfx.ImageLoader;

public class Game implements Runnable {
	
	private Display display;
	public int width, height;
	public String title;
	
	private boolean running = false;
	private Thread thread;
	
	private BufferStrategy bs;
	private Graphics g;
	
	private BufferedImage testImage;
	
	public Game(String title, int width, int height) {
		this.width = width;
		this.height = height;
		this.title = title;
	}
	
	private void init() { 
		display = new Display(title, width, height);
		testImage = ImageLoader.loadImage("/textures/imagem.png");
	}
	
	private void tick() {
		
	}
	
	private void render() {
		bs = display.getCanvas().getBufferStrategy();
		if(bs == null) {
			display.getCanvas().createBufferStrategy(3);
			return;
		}
		g = bs.getDrawGraphics();
		// Draw começa aqui!
		
		g.drawImage(testImage, 0, 0, null);
		
		
		
		
		// Fim Draw
		bs.show();
		g.dispose();
	}
	
	public void run() {
		
		init();
		
		while(running) {
			tick();
			render();
			
		}
		
		stop();
		
	}
	
	public synchronized void start() {
		if(running)
			return;
		running = true;
		thread = new Thread(this);
		thread.start();
	}
	
	public synchronized void stop() {
		if(!running)
			return;
		running = false;
		try {
			thread.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
	}
	
}
