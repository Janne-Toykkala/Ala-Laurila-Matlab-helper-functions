function rootDir = getRootPath()

  tmp = which('setPaths');
  rootDir = tmp(1:find(tmp==filesep, 1, 'last'));

end