@extends('layouts.main')

@section('title')
    AI News Engine
@endsection

@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">AI News Engine</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item text-dark">
                            <a href="{{ route('home') }}" class="text-dark"><i class="fas fa-home mr-1"></i>{{ __('dashboard') }}</a>
                        </li>
                        <li class="breadcrumb-item active"><i class="nav-icon fas fa-robot mr-1"></i>AI News</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            @if (session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif
            @if (session('error'))
                <div class="alert alert-danger">{{ session('error') }}</div>
            @endif

            <form action="{{ route('ai-news.update') }}" method="POST">
                @csrf
                <div class="row">
                    {{-- Engine + provider --}}
                    <div class="col-md-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header"><h3 class="card-title">Engine</h3></div>
                            <div class="card-body">
                                <div class="form-group">
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="is_enabled" name="is_enabled" value="1" {{ $settings->is_enabled ? 'checked' : '' }}>
                                        <label class="custom-control-label" for="is_enabled">Enable AI auto-generation (cron)</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="auto_publish" name="auto_publish" value="1" {{ $settings->auto_publish ? 'checked' : '' }}>
                                        <label class="custom-control-label" for="auto_publish">Auto-publish live (off = save as draft)</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Active Provider</label>
                                    <select name="provider" class="form-control">
                                        <option value="openai" {{ $settings->provider == 'openai' ? 'selected' : '' }}>OpenAI (GPT)</option>
                                        <option value="gemini" {{ $settings->provider == 'gemini' ? 'selected' : '' }}>Google Gemini</option>
                                        <option value="claude" {{ $settings->provider == 'claude' ? 'selected' : '' }}>Anthropic Claude</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Articles per run</label>
                                    <input type="number" name="per_run_count" class="form-control" min="1" max="50" value="{{ $settings->per_run_count }}">
                                </div>
                            </div>
                        </div>

                        <div class="card card-primary card-outline">
                            <div class="card-header"><h3 class="card-title">Provider API Keys</h3></div>
                            <div class="card-body">
                                <p class="text-muted">Keys are stored encrypted. Leave a field blank to keep the saved key.</p>
                                <div class="form-group">
                                    <label>OpenAI API Key</label>
                                    <input type="password" name="openai_api_key" class="form-control" placeholder="{{ $settings->openai_api_key ? '•••••••• (saved)' : 'sk-...' }}" autocomplete="off">
                                    <input type="text" name="openai_model" class="form-control mt-2" value="{{ $settings->openai_model }}" placeholder="gpt-4o-mini">
                                </div>
                                <div class="form-group">
                                    <label>Gemini API Key</label>
                                    <input type="password" name="gemini_api_key" class="form-control" placeholder="{{ $settings->gemini_api_key ? '•••••••• (saved)' : 'AIza...' }}" autocomplete="off">
                                    <input type="text" name="gemini_model" class="form-control mt-2" value="{{ $settings->gemini_model }}" placeholder="gemini-1.5-flash">
                                </div>
                                <div class="form-group">
                                    <label>Claude API Key</label>
                                    <input type="password" name="claude_api_key" class="form-control" placeholder="{{ $settings->claude_api_key ? '•••••••• (saved)' : 'sk-ant-...' }}" autocomplete="off">
                                    <input type="text" name="claude_model" class="form-control mt-2" value="{{ $settings->claude_model }}" placeholder="claude-3-5-sonnet-20241022">
                                </div>
                            </div>
                        </div>
                    </div>

                    {{-- Content + source --}}
                    <div class="col-md-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header"><h3 class="card-title">Publishing Defaults</h3></div>
                            <div class="card-body">
                                <div class="form-group">
                                    <label>Default Language</label>
                                    <select name="default_language_id" class="form-control">
                                        <option value="0">— select —</option>
                                        @foreach ($languages as $lang)
                                            <option value="{{ $lang->id }}" {{ $settings->default_language_id == $lang->id ? 'selected' : '' }}>{{ $lang->language }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Default Category</label>
                                    <select name="default_category_id" class="form-control">
                                        <option value="0">— select —</option>
                                        @foreach ($categories as $cat)
                                            <option value="{{ $cat->id }}" {{ $settings->default_category_id == $cat->id ? 'selected' : '' }}>{{ $cat->category_name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="row">
                                    <div class="col-6 form-group">
                                        <label>Min words</label>
                                        <input type="number" name="min_words" class="form-control" value="{{ $settings->min_words }}">
                                    </div>
                                    <div class="col-6 form-group">
                                        <label>Max words</label>
                                        <input type="number" name="max_words" class="form-control" value="{{ $settings->max_words }}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Editorial tone / style</label>
                                    <textarea name="tone" class="form-control" rows="2">{{ $settings->tone }}</textarea>
                                </div>
                            </div>
                        </div>

                        <div class="card card-primary card-outline">
                            <div class="card-header"><h3 class="card-title">Source</h3></div>
                            <div class="card-body">
                                <div class="form-group">
                                    <label>Source mode</label>
                                    <select name="source_mode" class="form-control" id="source_mode">
                                        <option value="topics" {{ $settings->source_mode == 'topics' ? 'selected' : '' }}>Seed topics / keywords</option>
                                        <option value="rss" {{ $settings->source_mode == 'rss' ? 'selected' : '' }}>RSS feeds (rewrite into original articles)</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Seed topics (one per line)</label>
                                    <textarea name="topics" class="form-control" rows="5" placeholder="Indian startup funding news&#10;Delhi weather update&#10;Cricket match results">{{ $settings->topics }}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>RSS feed URLs (one per line)</label>
                                    <textarea name="rss_urls" class="form-control" rows="3" placeholder="https://example.com/feed.xml">{{ $settings->rss_urls }}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <div>
                            <button type="submit" class="btn btn-primary"><i class="fas fa-save mr-1"></i>Save Settings</button>
                            <a href="{{ route('ai-news.logs') }}" class="btn btn-default ml-2"><i class="fas fa-list mr-1"></i>View Logs</a>
                        </div>
                        <small class="text-muted">Last run: {{ $settings->last_run_at ? $settings->last_run_at->diffForHumans() : 'never' }}</small>
                    </div>
                </div>
            </form>

            <div class="card">
                <div class="card-body">
                    <form action="{{ route('ai-news.generate') }}" method="POST" onsubmit="this.querySelector('button').disabled=true;this.querySelector('button').innerHTML='Generating...';">
                        @csrf
                        <button type="submit" class="btn btn-success"><i class="fas fa-bolt mr-1"></i>Generate Now (test run)</button>
                        <small class="text-muted ml-2">Runs one batch immediately using the saved settings.</small>
                    </form>
                </div>
            </div>
        </div>
    </section>
@endsection
