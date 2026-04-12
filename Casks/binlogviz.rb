cask "binlogviz" do
  version "0.16.0"

  on_macos do
    on_intel do
      sha256 "8294295afa647dbf5ec279f9accfdc6f799ec7c3b1fd88555b2d9fb4a6d5e61e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.16.0/binlogviz_0.16.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "406e8823481c84cf8c5c190e1d0d58282577f1e1228b188749dcad4249f68e22"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.16.0/binlogviz_0.16.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "e18e157e2d1a2499b482f89726b440137312bcb1158d2a2c792a046f194f9f62"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.16.0/binlogviz_0.16.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "1981e5520b3c20bb3f7a5e8589e7a77c9113b262944e524e7e844be58494f248"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.16.0/binlogviz_0.16.0_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
