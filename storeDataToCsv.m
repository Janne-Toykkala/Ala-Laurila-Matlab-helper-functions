function storeDataToCsv(savePath, colLabels, colData)
  
  fileId = fopen([savePath, '.csv'], 'w');
  % Header
  fprintf(fileId, ',');
  for col = 1:numel(colLabels)-1
    fprintf(fileId, '%s,', colLabels{col});
  end
  fprintf(fileId, '%s', colLabels{end});
  fprintf(fileId, '\n');

  % Data
  rowCounts = cellfun(@(c)numel(c), colData);
  for row = 1:max(rowCounts)
    fprintf(fileId, '%i,', row);
    for col = 1:numel(colLabels)-1
      if row <= rowCounts(col)
        if colData{col}(row) > 1e-2
          fprintf(fileId, '%2.4f,', colData{col}(row));
        else
          fprintf(fileId, '%2.4e,', colData{col}(row));
        end
      else
        fprintf(fileId, ',');
      end
    end
    if row <= rowCounts(end)
      if colData{end}(row) > 1e-2
        fprintf(fileId, '%2.4f', colData{end}(row));
      else
        fprintf(fileId, '%2.4e', colData{end}(row));
      end
    end
    fprintf(fileId, '\n');
  end

  fclose(fileId);
  
end