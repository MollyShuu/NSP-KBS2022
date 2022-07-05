clear all
clc;
figure(1)
NN=10; 
X = linspace(0,pi*3,1000); 
Y = bsxfun(@(x,n)sin(x+2*n*pi/NN), X.', 1:NN); 
C = linspecer(NN); 
C1=repmat(C(5,:),[NN,1]);
axes('NextPlot','replacechildren', 'ColorOrder',C); 
plot(X,Y,'linewidth',5) 
ylim([-1.1 1.1]);

fVect=[0.02;0.1;0.2;0.3;0.4];
xistep=0.1;
runs=10;
xifrac=0:xistep:0.4;
alphaVect=-20:20;
metrics=["m","p"];
metricsindex=2;
fname='./results/'; 
datasetname=["TF_zf_","TF_full_","Higgs_FSMT_deg5_","Higgs_FSRT_deg5_"];
titleforsubfig=["(a)","(b)","(c)","(d)","(e)","(f)","(g)","(h)","(i)","(j)","(k)","(l)","(m)","(n)","(o)","(p)"];
known_rate=0.9;
nrate=0.9;
premethodlist=[1,2];

for datasetindex=1:1:4
    datasetindex1=datasetindex;
    for premethodindex=1:1:2
        premethod=premethodlist(1,premethodindex);
        datarepnum=10;
        for reptime=1:1:datarepnum
            reptime1=reptime;
            filename=[datasetname{1,datasetindex1} 'knr' mat2str(nrate*10) '_rtime' mat2str(reptime1) '_' metrics{1,metricsindex} '_pmeth' mat2str(premethod) '_dmeth1_nst2_alst1.txt'];
            dataload=load([fname filename]);
            if reptime==1
                data=dataload;
            else
                data=data+dataload;
            end
        end
        data=data./datarepnum;
        figure(10+(datasetindex-1)*2+premethodindex)
        xlabel('\eta','fontsize',10)
        if metricsindex==1
            ylabel('MAP','fontsize',10)
        else
            ylabel('P@30','fontsize',10)
        end
        
        hold on
        title(titleforsubfig{1,(datasetindex-1)*2+premethodindex},'fontsize',10);
        plot(alphaVect,data(6,:),'s-','Color',C(2,:),'MarkerFaceColor',C(2,:),'LineWidth',0.5,'MarkerSize',4.2); 
        plot(alphaVect,data(11,:),'<-','Color',C(3,:),'MarkerFaceColor',C(3,:),'LineWidth',0.5,'MarkerSize',3.7); 
        plot(alphaVect,data(16,:),'>-','Color',C(1,:),'MarkerFaceColor',C(1,:),'LineWidth',0.5,'MarkerSize',3.7); 
        plot(alphaVect,data(21,:),'o-','Color','r','MarkerFaceColor','r','LineWidth',0.5,'MarkerSize',3.6); 
        h1=legend(['\xi=',num2str(fVect(2))],...
        ['\xi=',num2str(fVect(3))],['\xi=',num2str(fVect(4))],...
        ['\xi=',num2str(fVect(5))])
        set(h1,'Orientation')
        set(h1,'fontsize',10,'box','off')
        set(gca,'FontSize',10)
        grid on;
    end
end

for datasetindex=1:1:4
    datasetindex1=datasetindex;
    for premethodindex=1:1:2
        premethod=premethodlist(1,premethodindex);
        datarepnum=10;
        for reptime=1:1:datarepnum
            reptime1=reptime;
            filename=[datasetname{1,datasetindex1} 'knr' mat2str(nrate*10) '_rtime' mat2str(reptime1) '_' metrics{1,metricsindex} '_pmeth' mat2str(premethod) '_dmeth2_nst2_alst1.txt'];
            dataload=load([fname filename]);
            if reptime==1
                data=dataload;
            else
                data=data+dataload;
            end
        end
        data=data./datarepnum;

        figure(20+(datasetindex-1)*2+premethodindex)
        xlabel('\eta')
        if metricsindex==1
            ylabel('MAP')
        else
            ylabel('P@30')
        end
        hold on
        title(titleforsubfig{1,(datasetindex-1)*2+premethodindex});
        plot(alphaVect,data(6,:),'s-','Color',C(2,:),'MarkerFaceColor',C(2,:),'LineWidth',0.5,'MarkerSize',4.2); 
        plot(alphaVect,data(11,:),'<-','Color',C(3,:),'MarkerFaceColor',C(3,:),'LineWidth',0.5,'MarkerSize',3.7); 
        plot(alphaVect,data(16,:),'>-','Color',C(1,:),'MarkerFaceColor',C(1,:),'LineWidth',0.5,'MarkerSize',3.7); 
        plot(alphaVect,data(21,:),'o-','Color','r','MarkerFaceColor','r','LineWidth',0.5,'MarkerSize',3.6); 
        h1=legend(['\xi=',num2str(fVect(2))],...
        ['\xi=',num2str(fVect(3))],['\xi=',num2str(fVect(4))],...
        ['\xi=',num2str(fVect(5))])
        set(h1,'Orientation')
        set(h1,'fontsize',10,'box','off')
        set(gca,'FontSize',10)
        grid on;
    end
end

fVect=[-20;10;0;10;20];
xistep=0.02;
runs=10;
xifrac=0:xistep:0.4;
for datasetindex=1:1:4
    datasetindex1=datasetindex;
    for premethodindex=1:1:2
        premethod=premethodlist(1,premethodindex);
        datarepnum=10;
        for reptime=1:1:datarepnum
            reptime1=reptime;
            filename=[datasetname{1,datasetindex1} 'knr' mat2str(nrate*10) '_rtime' mat2str(reptime1) '_' metrics{1,metricsindex} '_pmeth' mat2str(premethod) '_dmeth1_nst2_alst1.txt'];
            dataload=load([fname filename]);
            if reptime==1
                data=dataload;
            else
                data=data+dataload;
            end
        end
        data=data./datarepnum;
        figure(30+(datasetindex-1)*2+premethodindex)
        xlabel('\xi')
        if metricsindex==1
            ylabel('MAP')
        else
            ylabel('P@30')
        end
        hold on
        title(titleforsubfig{1,(datasetindex-1)*2+premethodindex});
        plot(xifrac,data(:,1),'d-','Color',C(8,:),'MarkerFaceColor',C(8,:),'LineWidth',0.5,'MarkerSize',3.7); 
        plot(xifrac,data(:,11),'s-','Color',C(2,:),'MarkerFaceColor',C(2,:),'LineWidth',0.5,'MarkerSize',4.2); 
        plot(xifrac,data(:,21),'<-','Color',C(3,:),'MarkerFaceColor',C(3,:),'LineWidth',0.5,'MarkerSize',3.7); 
        plot(xifrac,data(:,31),'>-','Color',C(1,:),'MarkerFaceColor',C(1,:),'LineWidth',0.5,'MarkerSize',3.7); 
        plot(xifrac,data(:,41),'o-','Color','r','MarkerFaceColor','r','LineWidth',0.5,'MarkerSize',3.6); 
        h1=legend(['\eta=',num2str(fVect(1))],['\eta=',num2str(fVect(2))],...
        ['\eta=',num2str(fVect(3))],['\eta=',num2str(fVect(4))],...
        ['\eta=',num2str(fVect(5))])
        set(h1,'Orientation')
        set(h1,'fontsize',10,'box','off')
        set(gca,'FontSize',10)
        grid on;
    end
end

for datasetindex=1:1:4
    datasetindex1=datasetindex;
    for premethodindex=1:1:2
        premethod=premethodlist(1,premethodindex);
        datarepnum=10;
        for reptime=1:1:datarepnum
            reptime1=reptime;
            filename=[datasetname{1,datasetindex1} 'knr' mat2str(nrate*10) '_rtime' mat2str(reptime1) '_' metrics{1,metricsindex} '_pmeth' mat2str(premethod) '_dmeth2_nst2_alst1.txt'];
            dataload=load([fname filename]);
            if reptime==1
                data=dataload;
            else
                data=data+dataload;
            end
        end
        data=data./datarepnum;
        figure(40+(datasetindex-1)*2+premethodindex)
        xlabel('\xi')
        if metricsindex==1
            ylabel('MAP')
        else
            ylabel('P@30')
        end
        hold on
        title(titleforsubfig{1,(datasetindex-1)*2+premethodindex});
        plot(xifrac,data(:,1),'d-','Color',C(8,:),'MarkerFaceColor',C(8,:),'LineWidth',0.5,'MarkerSize',3.7); 
        plot(xifrac,data(:,11),'s-','Color',C(2,:),'MarkerFaceColor',C(2,:),'LineWidth',0.5,'MarkerSize',4.2); 
        plot(xifrac,data(:,21),'<-','Color',C(3,:),'MarkerFaceColor',C(3,:),'LineWidth',0.5,'MarkerSize',3.7); 
        plot(xifrac,data(:,31),'>-','Color',C(1,:),'MarkerFaceColor',C(1,:),'LineWidth',0.5,'MarkerSize',3.7); 
        plot(xifrac,data(:,41),'o-','Color','r','MarkerFaceColor','r','LineWidth',0.5,'MarkerSize',3.6); 
        h1=legend(['\eta=',num2str(fVect(1))],['\eta=',num2str(fVect(2))],...
        ['\eta=',num2str(fVect(3))],['\eta=',num2str(fVect(4))],...
        ['\eta=',num2str(fVect(5))])
        set(h1,'Orientation')
        set(h1,'fontsize',10,'box','off')
        set(gca,'FontSize',10)
        grid on;
    end
end

fVect=[0.02;0.1;0.2;0.3;0.4];
xistep=0.1;
runs=10;
xifrac=0:xistep:0.4;
alphaVect=-20:20;
metricsindex=2;
premethodlist=[1,2];

for datasetindex=1:1:4
    datasetindex1=datasetindex;
    for premethodindex=1:1:2
        premethod=premethodlist(1,premethodindex);
        datarepnum=10;
            for reptime=1:1:datarepnum
                reptime1=reptime;
                filename=[datasetname{1,datasetindex1} 'knr' mat2str(nrate*10) '_rtime' mat2str(reptime1) '_' metrics{1,metricsindex} '_pmeth' mat2str(premethod) '_dmeth1_nst2_alst1.txt'];
                dataload=load([fname filename]);
                if reptime==1
                    data=dataload;
                else
                    data=data+dataload;
                end
            end
         data=data./datarepnum;
         figure(50+(datasetindex-1)*2+premethodindex)
         y=0:0.02:0.4;
         x=-20:1:20;
         z=data;
         surf(y,x,data')
         meshc(y,x,data') 
         xlabel('\xi')
         ylabel('\eta')
         if metricsindex==1
            zlabel('MAP')
        else
            zlabel('P@30')
        end
         hold on
         title(titleforsubfig{1,(datasetindex-1)*2+premethodindex});
         grid on;
    end
end

for datasetindex=1:1:4
    datasetindex1=datasetindex;
    for premethodindex=1:1:2
        premethod=premethodlist(1,premethodindex);
        datarepnum=10;
        for reptime=1:1:datarepnum
            reptime1=reptime;
            filename=[datasetname{1,datasetindex1} 'knr' mat2str(nrate*10) '_rtime' mat2str(reptime1) '_' metrics{1,metricsindex} '_pmeth' mat2str(premethod) '_dmeth2_nst2_alst1.txt'];
            dataload=load([fname filename]);
            if reptime==1
                data=dataload;
            else
                data=data+dataload;
            end
        end
        data=data./datarepnum;
         figure(60+(datasetindex-1)*2+premethodindex)
         y=0:0.02:0.4;
         x=-20:1:20;
         z=data;
         surf(y,x,data')
         meshc(y,x,data') 
         xlabel('\xi')
         ylabel('\eta')
         if metricsindex==1
            zlabel('MAP')
        else
            zlabel('P@30')
        end
         hold on
         title(titleforsubfig{1,(datasetindex-1)*2+premethodindex});
         grid on;
    end
end









