param globalTags object
param environmentTag object
param resourceTag object

output mergedTags object = union(globalTags, environmentTag, resourceTag)
