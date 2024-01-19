package proxy;

public class Proxy implements ISubject{

	private RealSubject realSubject;
	
	
	public Proxy(RealSubject realSubject) {
		super();
		this.realSubject = realSubject;
	}


	@Override
	public void action() {
		System.out.println("로깅............");
		System.out.println("프록시 객체");
		realSubject.action();
		System.out.println("로깅............");
		
	}
	

}
