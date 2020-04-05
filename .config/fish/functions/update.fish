# Defined in - @ line 1
function update --description 'alias update=sudo apt update && sudo apt upgrade -y'
	sudo apt update && sudo apt upgrade -y $argv;
end
