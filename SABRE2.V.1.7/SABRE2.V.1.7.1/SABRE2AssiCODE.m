function SABRE2AssiCODE(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
   Rval,BNodevalue,SNodevalue,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% ******    ASSIGN Segments for Materials and # of elements    ************
% ************************************************************************

if isempty(JNodevalue)||isempty(Massemble)||isempty(BNodevalue) ...
      || isempty(JNodevalue_i) || isempty(JNodevalue_j)
   mem =[];
else
   mem=length(Massemble(:,1));
   Ta=max(max(max(JNodevalue_i(:,6)),max(JNodevalue_i(:,8))));
% ------------------------------------------------------------------------   
% ----------------              Plot Segments           ------------------ 
% ------------------------------------------------------------------------ 
   BJvalue = [];
   for i = 1:mem 
      if isequal(BNodevalue(i,1,2),0) % No bracing
         mnum = BNodevalue(i,1,1);
         BJvalue(1,1) = JNodevalue_i(mnum,3);
         BJvalue(2,1) = JNodevalue_j(mnum,3);
         BJvalue(1,2) = JNodevalue_i(mnum,4);
         BJvalue(2,2) = JNodevalue_j(mnum,4);
         BJvalue(1,3) = JNodevalue_i(mnum,5);
         BJvalue(2,3) = JNodevalue_j(mnum,5);
         plot3(axesm,BJvalue(:,1),-BJvalue(:,3),BJvalue(:,2),'Color','b',...
            'Tag',['M',num2str(i),'S',num2str(1)],'HitTest','off');
         if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
            text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,['M',num2str(i),'S',num2str(1)],...
               'VerticalAlignment','baseline','FontSize',8,'Color','k','HitTest','on','Tag','S','Visible','off');
            hold on;
         elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % background background
            text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,['M',num2str(i),'S',num2str(1)],...
               'VerticalAlignment','baseline','FontSize',8,'Color','w','HitTest','on','Tag','S','Visible','off');
            hold on;
         end
         BJvalue = []; % Empty Temporal Bracing
      elseif isequal(max(BNodevalue(i,:,2)),1) % One bracing
         mnum = BNodevalue(i,1,1);
         nbnode = max(BNodevalue(i,:,2));
         BJvalue(1,1) = JNodevalue_i(mnum,3);
         BJvalue(2,1) = BNodevalue(i,nbnode,3);
         BJvalue(1,2) = JNodevalue_i(mnum,4);
         BJvalue(2,2) = BNodevalue(i,nbnode,4);
         BJvalue(1,3) = JNodevalue_i(mnum,5);
         BJvalue(2,3) = BNodevalue(i,nbnode,5);
         plot3(axesm,BJvalue(:,1),-BJvalue(:,3),BJvalue(:,2),'Color','b',...
            'Tag',['M',num2str(i),'S',num2str(nbnode)],'HitTest','off');
         if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
            text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,['M',num2str(i),'S',num2str(nbnode)],...
               'VerticalAlignment','baseline','FontSize',8,'Color','k','HitTest','on','Tag','S','Visible','off');
            hold on;
         elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
            text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,['M',num2str(i),'S',num2str(nbnode)],...
               'VerticalAlignment','baseline','FontSize',8,'Color','w','HitTest','on','Tag','S','Visible','off');
            hold on;
         end
         BJvalue = []; % Empty Temporal Bracing

         BJvalue(1,1) = BNodevalue(i,nbnode,3);
         BJvalue(2,1) = JNodevalue_j(mnum,3);
         BJvalue(1,2) = BNodevalue(i,nbnode,4);
         BJvalue(2,2) = JNodevalue_j(mnum,4);
         BJvalue(1,3) = BNodevalue(i,nbnode,5);
         BJvalue(2,3) = JNodevalue_j(mnum,5);
         plot3(axesm,BJvalue(:,1),-BJvalue(:,3),BJvalue(:,2),'Color','b',...
            'Tag',['M',num2str(i),'S',num2str(nbnode+1)],'HitTest','off');
         if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
            text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,['M',num2str(i),'S',num2str(nbnode+1)],...
               'VerticalAlignment','baseline','FontSize',8,'Color','k','HitTest','on','Tag','S','Visible','off');
            hold on;
         elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
            text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,['M',num2str(i),'S',num2str(nbnode+1)],...
               'VerticalAlignment','baseline','FontSize',8,'Color','w','HitTest','on','Tag','S','Visible','off');
            hold on;
         end
         BJvalue = []; % Empty Temporal Bracing
      else
         mnum = BNodevalue(i,1,1);
         nbnode = max(BNodevalue(i,:,2));
         BJvalue(1,1) = JNodevalue_i(mnum,3);
         BJvalue(2,1) = BNodevalue(i,1,3);
         BJvalue(1,2) = JNodevalue_i(mnum,4);
         BJvalue(2,2) = BNodevalue(i,1,4);
         BJvalue(1,3) = JNodevalue_i(mnum,5);
         BJvalue(2,3) = BNodevalue(i,1,5);
         plot3(axesm,BJvalue(:,1),-BJvalue(:,3),BJvalue(:,2),'Color','b',...
            'Tag',['M',num2str(i),'S',num2str(1)],'HitTest','off');
         if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
            text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,['M',num2str(i),'S',num2str(1)],...
               'VerticalAlignment','baseline','FontSize',8,'Color','k','HitTest','on','Tag','S','Visible','off');
            hold on;
         elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
            text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,['M',num2str(i),'S',num2str(1)],...
               'VerticalAlignment','baseline','FontSize',8,'Color','w','HitTest','on','Tag','S','Visible','off');
            hold on;
         end
         BJvalue = []; % Empty Temporal Bracing

         for j = 1:nbnode-1
            BJvalue(1,1) = BNodevalue(i,j,3);
            BJvalue(2,1) = BNodevalue(i,j+1,3);
            BJvalue(1,2) = BNodevalue(i,j,4);
            BJvalue(2,2) = BNodevalue(i,j+1,4);
            BJvalue(1,3) = BNodevalue(i,j,5);
            BJvalue(2,3) = BNodevalue(i,j+1,5);
            plot3(axesm,BJvalue(:,1),-BJvalue(:,3),BJvalue(:,2),'Color','b',...
               'Tag',['M',num2str(i),'S',num2str(j+1)],'HitTest','off');
            if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
               text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,...
                  ['M',num2str(i),'S',num2str(j+1)],...
                  'VerticalAlignment','baseline','FontSize',8,'Color','k','HitTest','on','Tag','S','Visible','off');
               hold on;
            elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
               text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,...
                  ['M',num2str(i),'S',num2str(j+1)],...
                  'VerticalAlignment','baseline','FontSize',8,'Color','w','HitTest','on','Tag','S','Visible','off');
               hold on;
            end
            BJvalue = []; % Empty Temporal Bracing
         end

         BJvalue(1,1) = BNodevalue(i,nbnode,3);
         BJvalue(2,1) = JNodevalue_j(mnum,3);
         BJvalue(1,2) = BNodevalue(i,nbnode,4);
         BJvalue(2,2) = JNodevalue_j(mnum,4);
         BJvalue(1,3) = BNodevalue(i,nbnode,5);
         BJvalue(2,3) = JNodevalue_j(mnum,5);
         plot3(axesm,BJvalue(:,1),-BJvalue(:,3),BJvalue(:,2),'Color','b',...
            'Tag',['M',num2str(i),'S',num2str(nbnode+1)],'HitTest','off');
         if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
            text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,['M',num2str(i),'S',num2str(nbnode+1)],...
               'VerticalAlignment','baseline','FontSize',8,'Color','k','HitTest','on','Tag','S','Visible','off');
            hold on;
         elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
            text(sum(BJvalue(:,1))/2,-sum(BJvalue(:,3))/2-Ta,sum(BJvalue(:,2))/2,['M',num2str(i),'S',num2str(nbnode+1)],...
               'VerticalAlignment','baseline','FontSize',8,'Color','w','HitTest','on','Tag','S','Visible','off');
            hold on;
         end
         BJvalue = []; % Empty Temporal Bracing
      end
   end
   % **************************************** Plot Bracing Segment E
  
end


