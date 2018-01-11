function score = SSEQ( imdist )

  %Get and visit the current path to ensure no svm-predict conflict.
  scriptName = mfilename('fullpath');
  [currentpath, filename, fileextension]= fileparts(scriptName);
  cd(currentpath)
  
    feature=feature_extract(imdist,3);
    score=SSQA_by_f(feature);

end
