# My Master's Degree Thesis for Chinese Grammatical Error Correction
TODO


## Setting Up
TODO


## Codes Related to Chapter 4th

### Pre-training Word Embeddings

#### Pre-training Chinese Word2vec Embeddings
TODO

#### Pre-training Chinese Wang2vec Embeddings
TODO

#### Pre-training Chinese Cw2vec Embeddings
TODO

### Training a Single Model
Go to `training/` directory and use `one_script_to_run_all.sh` to train the model by specifying model architecture, model level, which pre-trained embeddings to use and data fusion mode.

### Data Cleaning Experiments
Go to `training/` directory and use `tune_long_low_high.sh` to determine filtering thresholds including `long`, `low` and `high` parameters.


## For Chapter 5th

### Training Single Models with Different Random Seeds
Go to `training/` directory and use `tune_random_seed.sh` to train single models with different random number seeds.

### Pre-training 5-Gram Language Models
TODO

### Ensemble Decoding + Re-ranking Mechanism
Reproduce experiments of chapter 5 of my master's dissertation with `training/rerank_experiment.sh`. The `rerank_experiment.sh` shell script trains the re-ranker calling `training/train_reranker.sh` firstly, and then applies the re-ranking mechanism via `training/run_trained_model.sh`. Go to `training/` directory and run `rerank_experiment.sh` script directly in the terminal for more details.


## For Chapter 6

### Multi-channel Fusion Framework + Re-ranking Mechanism
Multi-channel fusion and re-ranking using `training/multi_channel_fusion_experiment.sh`. The `multi_channel_fusion_experiment.sh` bash script trains the re-ranker components calling `training/train_multi_channel_fusion_reranker.sh` firstly, and then multi-channel fusion and applies the re-ranking mechanism via `training/multi_channel_fusion.sh`. Go to `training/` directory and run `multi_channel_fusion_experiment.sh` script directly in the terminal for more details.

### Reproduce Experiments of Chapter 6 of My Master's Dissertation
Reproduce experiments of chapter 6 of my master's dissertation with `training/all_experiments_multi_channel_fusion.sh`.
