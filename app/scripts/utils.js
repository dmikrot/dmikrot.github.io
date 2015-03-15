exports.lpad = function lpad(str, pad) {
  return (pad + str).slice(-pad.length);
};

exports.get_random_id = function get_random_id() {
  return exports.lpad(Math.floor(Math.random() * 10000000000), '00000000000');
};
