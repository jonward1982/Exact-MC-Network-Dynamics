% Coat hanger network
N=4;
A=zeros(N);
A(1,2)=1;
A(2,[3,4])=1;
A(3,4)=1;
A=A+A';
z=mean(full(sum(A,1)));

% Data structure of parameters for routines
p.neighbours=NeighboursAdjacency(A);

% Set up SIS parameters
beta=4;
p.beta=beta;
p.gamma=1;
p.qname='q_SIS';

% Compute State-space, generator, rates and min and max rates per level
[S,tolist,mu,levels]=BinaryMarkovGraph(N,p);
[Q,qlist]=BinaryInfinitesimalGenerator(S,tolist,mu,N,p);
[qrec,qinf]=Qrates(S,qlist);
[l,qm,qstd,qmin,qmax]=Qmean(qinf,levels,N);

% Compute true $C^T\Delta^TX$
C=sparse([1:2^N]',levels+1,ones(2^N,1),2^N,N+1);
D=(C*diag(1./sum(C,1)))';

nt=501;
tend=1000;
t=[0, logspace(-1,log10(tend),nt)];

% Solve Kolmogorov equation, initially middle node infected
options=odeset('RelTol',1e-8,'AbsTol',1e-8);
x0=0.*S;
x0(4)=1;
[~,x]=ode45(@(t,x) Q'*x,t,x0,options);
xl=x*levels;

% Quick plot
figure; 
semilogx(t,xl);
xlabel('t');
ylabel('Mean number of infected');
