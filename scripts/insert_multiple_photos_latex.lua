require('lfs')
local isPhoto = function(file)
    if string.sub(file,-4,-1) == 'jpeg' then
        return true
    end
    return false
end
local files,dir_obj = lfs.dir('/compile/Imagens')
for file in lfs.dir('/compile/Imagens') do 
    if (isPhoto(file)) then
        local cmd = {string.format('\\includegraphics[scale=0.35]{Imagens/%s}',file)}
        tex.tprint({'\\begin{figure}[h]'},{'\\centering'},cmd,{'\\end{figure}'})
    end
end
