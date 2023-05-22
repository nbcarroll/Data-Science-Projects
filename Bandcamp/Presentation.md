
### Data Source
One Million Transactions on the platform from September 9th, 2020 to October 2nd, 2020.

### How has this data been processed?
To generate more detailed categories of data from the dataset, Python was utilized. For instance, a transaction that involved a tote bag was previously coded as simply 'p', which denoted a physical item, without any additional categorization to specify that the item belonged to the 'Tote Bags' sub-category under the broader 'Accessories' category. However, by analyzing the 'item_description' feature, more granular information about each transaction was generated. In addition, additional features were created such as 'Buyer/Seller Country Match' to enable further analysis in the future. The Jupyter Notebook is linked below.
<br><br>
<i> <a href='https://www.kaggle.com/datasets/mathurinache/1000000-bandcamp-sales'>Original Data Source</a> | <a href='https://github.com/nbcarroll/Projects/blob/main/Bandcamp/Merchandise%20Analysis/bandcamp_sales_preprocessing.ipynb'>Jupyter Notebook</a></i>

###  Bandcamp has evolved into a comprehensive marketplace for not only music, but also merchandise.

Despite the fact that only 4.96% of vendors (artists/labels) on the platform sell merchandise, this revenue stream has proven to be incredibly lucrative. In fact, in just the 24 days studied, merchandise sales accounted for over 11% of Bandcamp's revenue, amounting to over a million dollars.
