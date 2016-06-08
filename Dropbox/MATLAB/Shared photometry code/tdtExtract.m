%% Extract photometry data from TDT Data Tank

path_to_data = '/Users/....'; % point to folder where data is

% set up Tank name, variables to extract
tankdir = [path_to_data];
tankname = 'enter your tankame';
blockname = 'enter your blockname';
storenames = {'LMag'}; % name of stores to extract from TDT (usu. 4-letter code) LMag is the demodulated data, may also have other timestamps etc

% extract
for k = 1:numel(storenames)
  storename = storenames{k};
  S{k} = tdt2mat(tankdir, tankname, blockname, storename);
end

%% Massage data and get time stamps

LMag = S{1}; %add more if you extracted more stores above

% For 2-color rig, LMag data is on channels 1 and 2, channel 1 = 470nm, channel 2 = 405nm
chani1 = LMag.channels==1;
chani2 = LMag.channels==2;

% Get LMag data as a vector (repeat for each channel)
dat1 = LMag.data(chani1,:);
dat1 = reshape(dat1', [],1); % unwrap data from m x 256 array
dat2 = LMag.data(chani2,:);
dat2 = reshape(dat2', [],1); % unwrap data from m x 256 array

% Get LMag timestamps (use chani1 - timestamps should be the same for all Wpht channels
ts = LMag.timestamps(chani1);
t_rec_start = ts(1);

ts = ts-ts(1); % convert from Unix time to 'seconds from block start'
ts = bsxfun(@plus, ts(:), (0:LMag.npoints-1)*(1./LMag.sampling_rate));
ts = reshape(ts',[],1);
