#!/usr/bin/ruby

module MergeRegion

  def sampletest
    return "good result"
  end

  def merge_region( region_array )

    region_array.sort!{|x, y| x[0].to_i <=> y[0].to_i }
    merged_region_array = []
    original_size       = 0

    while region_array.size != original_size 

      break if region_array.size <= 1
      region_array[0..-2].each_with_index do |r, i|
        if region_array[(i+1)][0] <= ( r[1] + 1 )
          if    ( r[1] <= region_array[(i+1)][1] )
            merged_region_array << [ r[0], region_array[(i+1)][1] ]
          elsif ( region_array[(i+1)][1] < r[1] )
            merged_region_array << [ r[0], r[1] ]
          end
          merged_region_array.concat(region_array[(i+2)..-1]) if region_array[(i+2)]
          break
        else
          if i + 2 == region_array.size
            merged_region_array << r
            merged_region_array << region_array[-1]
          else
            merged_region_array << r
          end
        end
      end
      merged_region_array.uniq!
      merged_region_array.sort!{|x, y| x[0].to_i <=> y[0].to_i }
      region_array.sort!{|x, y| x[0].to_i <=> y[0].to_i }
      original_size        = region_array.size
      region_array        = merged_region_array
      merged_region_array = []
      
    end
    region_array.sort!{|x, y| x[0].to_i <=> y[0].to_i } 
    return region_array 
    
  end

end



