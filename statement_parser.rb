

CATEGORIES = {
  'Groceries' => ['walmart', 'costco', 'superstore', 'whole foods', 'grocery'],
  'Dining' => ['restaurant', 'mcdonald', 'starbucks', 'dining', 'cafe'],
  'Entertainment' => ['netflix', 'spotify', 'theater', 'cinema', 'concert'],
  'Utilities' => ['hydro', 'electric', 'internet', 'bell', 'rogers'],
  'Transport' => ['uber', 'lyft', 'gas', 'shell', 'esso'],
  'Uncategorized' => []
}

def categorize
  # Categorize transactions based on the description and the mapping of keywords in CATEGORIES. 
  # Anything that cannot be found should be placed in Uncategorized
end

def analyze_statement(file)
  transactions = []

  CSV.foreach(file, headers: true) do |row| 
    date = row[:date]
    description = row[:description]
    amount = row[:amount]
    category = 

    transactions << {date: date, description: description, amount: amount}

    # Call a method to output a report to the console.
  end
end