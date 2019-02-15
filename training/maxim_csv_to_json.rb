require 'csv'
require 'json'

INPUT_CSV   = 'iob/0748Dhahabi.TarikhIslam.Shamela0035100-ara1.csv'
OUTPUT_JSON = 'json/0748Dhahabi.TarikhIslam.Shamela0035100-ara1.csv.json'

def convert()
  f = File.read(INPUT_CSV)
  CSV.parse(f, :headers => true, :col_sep => "\t").map do |row|
    sentence = row[0]
    startOffset = row[1]
    endOffset = row[2]

    [ sentence, { 'entities' =>
      [[ startOffset, endOffset, 'LOC' ]]
    }]
  end
end

f = File.open(OUTPUT_JSON, 'w')
f.write(JSON.pretty_generate(convert()))
f.close

print "Done."