exports.lpad = function lpad(str, pad) {
  return (pad + str).slice(-pad.length);
};
